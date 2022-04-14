import 'package:flutter/material.dart';
import 'food_image.dart';
import 'name_rate.dart';
import 'description_quantity.dart';

class FoodItem extends StatelessWidget {
  final double scs = 870.2727272727273;
  final String imageName;
  final String iconName;
  final String restaurantName;
  final String rating;
  final String caloryCount;
  final String description;
  final String itemName;
  final String price;
  final String deliveryTime;
  final Function onTap;
  FoodItem({
    required this.imageName,
    required this.iconName,
    required this.restaurantName,
    required this.rating,
    required this.caloryCount,
    required this.description,
    required this.itemName,
    required this.price,
    required this.deliveryTime,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    print('height = ' + height.toString());
    return ListView(scrollDirection: Axis.vertical, children: [
      Container(
        height: height,
        child: Stack(
          // alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            FoodImage(imageName),
            Positioned(
              top: 350 / scs * height,
              child: Center(
                child: NameRate(iconName, restaurantName, rating),
              ),
            ),
            Positioned(
              top: 450 / scs * height,
              child: Center(
                child: Description(
                  itemName: itemName,
                  price: price,
                  caloryCount: caloryCount,
                  deliveryTime: deliveryTime,
                  description: description,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
