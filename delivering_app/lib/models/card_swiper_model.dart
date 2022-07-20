import 'package:flutter/material.dart';

final List<String> sliderItems = [
  elevenEleven,
  blackFriday,
  cyberMonday,
  xmas,
];
String elevenEleven = 'images/order.png';
String blackFriday = 'images/del1.jpg';
String cyberMonday = 'images/del2.jpg';
String xmas = 'images/discount.jpg';

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
