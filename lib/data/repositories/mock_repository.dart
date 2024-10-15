import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/repositories/api_interface.dart';
import 'package:flutter_test_app/domain/models/card.dart';

class MockRepository extends ApiInterface {
  @override
  Future<List<CardData>?> loadData({OnErrorCallback? onError}) async {
    return [
      CardData(
        "Card 1",
        descriptionText: 'Not really interesting text',
        imageUrl:
        'https://sun9-80.userapi.com/impg/6zgTFCriDQjiAQITCZIMb6jCjViUBgo1fzMLwA/4MJOK5aBZt8.jpg?size=1622x2160&quality=95&sign=57b1751fe201d3728998e96ac3a7ed7a&type=album',
      ),
      CardData(
          'Card 2',
          descriptionText: 'Very interesting',
          imageUrl:
          'https://sun9-14.userapi.com/impg/ENCP7Z42aefArUjs-FHOpOmrr8U09L8UkX6kTg/JkbDM_FGhQo.jpg?size=1622x2160&quality=95&sign=d979c14a5d6a4c66035bfff434c1e69a&type=album'),
      CardData(
        'Orange',
        descriptionText: 'I like autumn',
        imageUrl:
            'https://furmanagers.com/wp-content/uploads/2019/11/dreamstime_l_22075357.jpg',
      ),
    ];
  }
}
