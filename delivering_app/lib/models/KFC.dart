import 'package:delivering_app/view/Food%20attributes/food_item.dart';
import 'package:flutter/material.dart';

class KFC extends StatelessWidget {
  const KFC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        "Deliciously hot and kickin'!Between the corn dusted bun lies tender, juicy boneless thigh meat, encased in a crisp and crumbling spicy crust, all topped with fresh lettuce, cheese and creamy mayonnaise to set your mouth on fire. ";
    return Scaffold(
      body: FoodItem(
        imageName: 'chicken.jpg',
        iconName: 'kfc_ic.svg',
        restaurantName: 'KFC',
        rating: '3.5',
        caloryCount: '145 Cal/200 gm',
        description: text,
        itemName: 'Crispy Chciken',
        price: '25',
        deliveryTime: '20-25 mins',
        onTap: () {},
      ),
    );
  }
}
