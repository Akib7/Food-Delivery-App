import 'package:delivering_app/controller/Providers/productProvider.dart';
import 'package:delivering_app/controller/Providers/user_provider.dart';
import 'package:delivering_app/config/constants.dart';

import 'package:delivering_app/view/Search/search.dart';
import 'package:delivering_app/view/home/drawer.dart';
import 'package:delivering_app/widgets/gesturePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'DetailPage.dart';
import 'dropDown.dart';
import 'getTabBar.dart';

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

  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  Widget popular(String image, double horizontal, double vertical) {
    return Padding(
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
    );
  }

  Widget itemDetails() {
    return GesturePage(onTap: () {});
    // return SingleChildScrollView(
    //   scrollDirection: Axis.horizontal,
    //   child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: productProvider.getFoodDataList.map<Widget>((foodData) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 12),
    //           child: GestureDetector(
    //             onTap: widget.onTap,
    //             child: Container(
    //               height: 307,
    //               width: 280,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(20),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.grey.withOpacity(0.2),
    //                     spreadRadius: 8,
    //                     blurRadius: 15,
    //                     offset: Offset(0, 3), // changes position of shadow
    //                   ),
    //                 ],
    //               ),
    //               child: Column(
    //                 children: [
    //                   getGestureDet(foodData.productImage),
    //                   Column(
    //                     children: [
    //                       deliverDet1(
    //                         foodData.productName,
    //                         foodData.productRating,
    //                       ),
    //                       deliveryDet2("(10-15 mins)"),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                         children: [
    //                           flatButton(Burger(), "Burger"),
    //                           flatButton(Chicken(), "Chicken"),
    //                           flatButton(Fastfood(), "Fastfood"),
    //                         ],
    //                       ),
    //                       Padding(
    //                         padding: const EdgeInsets.symmetric(horizontal: 20),
    //                         child: Row(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             flatButton(Steak(), "Steak"),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         );
    //       }).toList()
    // children: [
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 12),
    //     child: GestureDetector(
    //       onTap: () {
    //         Get.to(() => FoodContainer());
    //       },
    //       child: Container(
    //         height: 307,
    //         width: 280,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.2),
    //               spreadRadius: 8,
    //               blurRadius: 15,
    //               offset: Offset(0, 3), // changes position of shadow
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             getGestureDet(
    //                 'https://images.unsplash.com/photo-1550984754-8d1b067b0239?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1446&q=80'),
    //             Column(
    //               children: [
    //                 deliverDet1(
    //                   "McDonald's",
    //                   "4.5",
    //                 ),
    //                 deliveryDet2("(10-15 mins)"),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     flatButton(Burger(), "Burger"),
    //                     flatButton(Chicken(), "Chicken"),
    //                     flatButton(Fastfood(), "Fastfood"),
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       flatButton(Steak(), "Steak"),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 12),
    //     child: GestureDetector(
    //       onTap: () {
    //         Get.to(() => KFC());
    //       },
    //       child: Container(
    //         height: 307,
    //         width: 280,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.2),
    //               spreadRadius: 8,
    //               blurRadius: 15,
    //               offset: Offset(0, 3), // changes position of shadow
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             getGestureDet(
    //                 'https://images.unsplash.com/photo-1512152272829-e3139592d56f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
    //             Column(
    //               children: [
    //                 deliverDet1(
    //                   "KFC",
    //                   "3.5",
    //                 ),
    //                 deliveryDet2("(20-25 mins)"),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     flatButton(Chicken(), "Chicken"),
    //                     flatButton(Burger(), "Burger"),
    //                     flatButton(Fastfood(), "Fastfood"),
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       flatButton(Steak(), "Steak"),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 12,
    //     ),
    //     child: GestureDetector(
    //       onTap: () {
    //         Get.to(() => MadChef());
    //       },
    //       child: Container(
    //         height: 307,
    //         width: 280,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.2),
    //               spreadRadius: 8,
    //               blurRadius: 15,
    //               offset: Offset(0, 3), // changes position of shadow
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             getGestureDet(
    //                 'https://images.unsplash.com/photo-1605478371310-a9f1e96b4ff4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
    //             Column(
    //               children: [
    //                 deliverDet1(
    //                   "MadChef",
    //                   "4.0",
    //                 ),
    //                 deliveryDet2("(15-20 mins)"),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     flatButton(Pizza(), "Pizza"),
    //                     flatButton(Pasta(), "Pasta"),
    //                     flatButton(Fastfood(), "Fastfood"),
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       flatButton(Burger(), "Burger"),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(
    //       horizontal: 12,
    //     ),
    //     child: GestureDetector(
    //       onTap: () {
    //         Get.to(() => CrimsonCup());
    //       },
    //       child: Container(
    //         height: 307,
    //         width: 280,
    //         decoration: BoxDecoration(
    //           color: Colors.white,
    //           borderRadius: BorderRadius.circular(20),
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.grey.withOpacity(0.2),
    //               spreadRadius: 8,
    //               blurRadius: 15,
    //               offset: Offset(0, 3), // changes position of shadow
    //             ),
    //           ],
    //         ),
    //         child: Column(
    //           children: [
    //             getGestureDet(
    //                 'https://cuchimes.com/wp-content/uploads/2015/08/chimes-1-2.jpg'),
    //             Column(
    //               children: [
    //                 deliverDet1(
    //                   "Crimson Cup",
    //                   "5.0",
    //                 ),
    //                 deliveryDet2("(10-15 mins)"),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     flatButton(Espresso(), "Espresso"),
    //                     flatButton(Mocha(), "Mocha"),
    //                     flatButton(FrozenLatte(), "FrozenLatte"),
    //                   ],
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       flatButton(Capuccino(), "Capuccino"),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             // deliveryDetails(),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // ],
    //       ),
    // );
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
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
              ),
              dropDown(),
              Container(
                height: 150,
                width: 550,
                child: getTabBar(),
              ),
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
              itemDetails(),
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
                      popular('images/crimson.jpg', 28, 0),
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
                      popular('images/pizza.jpg', 40, 10),
                    ],
                  ),
                  popular('images/burger1.jpg', 40, 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 140,
                        width: 150,
                      ),
                      popular('images/burger2.jpg', 40, 20),
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
