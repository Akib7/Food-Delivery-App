import 'package:delivering_app/view/Food%20attributes/food_item.dart';
import 'package:flutter/material.dart';

class FoodContainer extends StatelessWidget {
  const FoodContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text =
        "Deliciously hot and kickin'!Between the corn dusted bun lies tender, juicy boneless thigh meat, encased in a crisp and crumbling spicy crust, all topped with fresh lettuce, cheese and creamy mayonnaise to set your mouth on fire. ";
    return Scaffold(
      body: FoodItem(
        imageName: 'mcdonalds.jpg',
        iconName: 'mcdonalds_ic.svg',
        restaurantName: 'Mcdonald\'s',
        rating: '4.5',
        caloryCount: '143 Cal/200 gm',
        description: text,
        itemName: 'Crispy burger',
        price: '15',
        deliveryTime: '10-15 mins',
        onTap: () {},
      ),
    );
  }
}
