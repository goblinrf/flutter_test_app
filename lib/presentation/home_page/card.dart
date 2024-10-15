part of 'home_page.dart';

typedef OnLikeCallBack = void Function(String title, bool isLiked)?;

class _Card extends StatefulWidget {
  final String text;
  final String descriptionText;
  final String? imageUrl;
  final OnLikeCallBack onLike;
  final VoidCallback? onTap;

  const _Card(this.text,{
      required this.descriptionText,
      this.imageUrl,
      this.onLike,
      this.onTap});

  factory _Card.fromData(
    CardData data, {
    OnLikeCallBack onLike,
    VoidCallback? onTap,
  }) =>
      _Card(
        data.text,
        descriptionText: data.descriptionText,
        imageUrl: data.imageUrl,
        onLike: onLike,
        onTap: onTap,
      );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: SizedBox(
          height: 150,
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: Colors.lightBlue,
                  width: 3,
                )),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    child: SizedBox(
                      height: double.infinity,
                      width: 120,
                      child: Image.network(
                        widget.imageUrl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Placeholder(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 4.0, right: 4.0, bottom: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 26),
                          ),
                          Text(
                            widget.descriptionText,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  //const Spacer(),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 4.0, right: 8.0, bottom: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                          widget.onLike?.call(widget.text, isLiked);
                        },
                        child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: isLiked
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    key: ValueKey<int>(0),
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    key: ValueKey<int>(1),
                                  )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
