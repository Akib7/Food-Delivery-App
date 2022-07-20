import 'package:flutter/material.dart';

final List<String> sliderItems = [
  elevenEleven,
  blackFriday,
  cyberMonday,
  xmas,
];
String elevenEleven = 'images/food.jpg';
String blackFriday = 'images/order.jpg';
String cyberMonday = 'images/del1.jpg';
String xmas = 'images/del2.jpg';

class CardSwiperModel extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const CardSwiperModel(this.image,
      {Key? key, required this.fit, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
