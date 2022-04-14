import 'package:delivering_app/view/Food%20attributes/food_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CrimsonCup extends StatelessWidget {
  const CrimsonCup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        "Deliciously hot and kickin'!Between the corn dusted bun lies tender, juicy boneless thigh meat, encased in a crisp and crumbling spicy crust, all topped with fresh lettuce, cheese and creamy mayonnaise to set your mouth on fire. ";
    return Scaffold(
      body: FoodItem(
          imageName: 'crimsoncup.jpg',
          iconName: 'crimsoncup_ic.svg',
          restaurantName: 'Crimson Cup',
          rating: '5.0',
          caloryCount: '150 Cal/200 gm',
          description: text,
          itemName: 'Crispy burger',
          price: '20',
          deliveryTime: '10-15 mins',
          onTap: () {
            Get.to(() => CrimsonCup());
          }),
    );
  }
}
