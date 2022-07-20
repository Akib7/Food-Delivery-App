import 'package:delivering_app/controller/Providers/productProvider.dart';
import 'package:delivering_app/controller/Providers/user_provider.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/models/CrimsonCup.dart';
import 'package:delivering_app/models/FoodContainer.dart';
import 'package:delivering_app/models/KFC.dart';
import 'package:delivering_app/models/MadChef.dart';

import 'package:delivering_app/view/Search/search.dart';
import 'package:delivering_app/view/home/drawer.dart';
import 'package:delivering_app/widgets/gesturePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../widgets/card_swiper.dart';
import 'DetailPage.dart';

class MyHomePage extends StatefulWidget {
  final void Function()? onTap;
  MyHomePage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ProductProvider productProvider;
  late UserProvider userProvider;

  bool liked = false;

  Widget popular(
      String image, double horizontal, double vertical, Widget page) {
    return GestureDetector(
      onTap: () {
        Get.to(() => page);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                height: 140,
                width: 150,
                fit: BoxFit.cover,
                image: AssetImage(image),
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
            ),
          ],
        ),
      ),
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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: DrawerData(
        userProvider: userProvider,
      ),
      appBar: AppBar(
        backgroundColor: primaryColour,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => SearchBar(
                          search: productProvider.foodProductList,
                        ));
                  },
                  icon: Icon(Icons.search),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                    image: AssetImage('images/cr7.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              CardSwiper(),
              SizedBox(
                width: 20,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Restaurants",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => DetailPage());
                        },
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
                height: 15,
              ),
              GesturePage(onTap: () {}),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 28),
                    child: Text(
                      "Popular Items",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      popular(
                        'images/crimson.jpg',
                        28,
                        0,
                        CrimsonCup(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextButton.icon(
                                label: Text(
                                  'View all',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                onPressed: () {
                                  Get.to(() => DetailPage());
                                },
                                icon: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(150),
                                  ),
                                  child: Icon(
                                    Icons.arrow_right_alt_outlined,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 140,
                        width: 150,
                      ),
                      popular(
                        'images/pizza.jpg',
                        40,
                        10,
                        MadChef(),
                      ),
                    ],
                  ),
                  popular(
                    'images/burger1.jpg',
                    40,
                    10,
                    KFC(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 140,
                        width: 150,
                      ),
                      popular(
                        'images/burger2.jpg',
                        40,
                        20,
                        FoodContainer(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
