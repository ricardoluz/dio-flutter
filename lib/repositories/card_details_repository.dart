import 'package:dio_flutter_study/models/card_detail.dart';

import '../widgets/lorem.dart';

class CardDetailsRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
      id: 1,
      title: "My Card",
      image: "assets/images/my_image.jpg",
      text: loremReturn(280),
    );
  }
}
