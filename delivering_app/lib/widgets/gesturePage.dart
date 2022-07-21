import 'package:delivering_app/controller/Providers/productProvider.dart';
import 'package:delivering_app/controller/Providers/user_provider.dart';

import 'package:delivering_app/view/Food%20attributes/food_overview.dart';
import 'package:delivering_app/view/food%20items/Burger.dart';
import 'package:delivering_app/view/food%20items/Chicken.dart';
import 'package:delivering_app/view/food%20items/Fastfood.dart';
import 'package:delivering_app/view/food%20items/Steak.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GesturePage extends StatefulWidget {
  final Function()? onTap;
  const GesturePage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GesturePage> createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  late ProductProvider productProvider;
  late UserProvider userProvider;

  bool liked = false;

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  Widget favButton(IconData icon) {
    return Positioned(
      top: 10,
      right: 10,
      // alignment: Alignment.topLeft,
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(70),
        ),
        child: IconButton(
          onPressed: () {
            _pressed();
          },
          icon: Icon(
            liked ? icon : Icons.favorite_border,
            color: liked ? Colors.red : Colors.grey,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget flatButton(Widget page, String text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey[200],

        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 7,
        ), // foreground
      ),
      onPressed: () {
        Get.to(() => page);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget deliverDet1(String name, double rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              '$rate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
              size: 14,
            ),
          ],
        ),
      ],
    );
  }

  Widget deliveryDet2(String time) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.delivery_dining,
                  color: Colors.red[700],
                  size: 14,
                ),
              ),
              Text(
                "Free Delivery",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Icon(
                Icons.timelapse,
                color: Colors.red[700],
                size: 14,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getGestureDet(String image) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image(
            height: 140,
            width: 280,
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          // alignment: Alignment.topLeft,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(70),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchProductData();

    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: productProvider.getFoodDataList.map<Widget>((foodData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => FoodOverview(
                      // productIcon: foodData.productIcon,
                      productPrice: foodData.productPrice,
                      productName: foodData.productName,
                      productImage: foodData.productImage,
                      productId: foodData.productId,
                      productIcon: foodData.productIcon,
                      productDescription: foodData.productDescription,
                      productRating: foodData.productRating,
                      itemName: foodData.itemName,
                      caloryCount: foodData.caloryCount,
                    ),
                  );
                },
                child: Container(
                  height: 307,
                  width: 280,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 15,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      getGestureDet(foodData.productImage),
                      Column(
                        children: [
                          deliverDet1(
                            foodData.productName,
                            foodData.productRating,
                          ),
                          deliveryDet2("(10-15 mins)"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              flatButton(Burger(), "Burger"),
                              flatButton(Chicken(), "Chicken"),
                              flatButton(Fastfood(), "Fastfood"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                flatButton(Steak(), "Steak"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
