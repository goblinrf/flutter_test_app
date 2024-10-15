class CardData {
  final String text;
  final String descriptionText;
  final String? imageUrl;
  final String? id;

  CardData(
    this.text,{
    required this.descriptionText,
    this.imageUrl,
    this.id,
  });
}
