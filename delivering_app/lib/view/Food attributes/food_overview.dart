import 'package:delivering_app/config/constants.dart';

import 'package:delivering_app/view/Review%20Cart/review_cart.dart';
import 'package:delivering_app/widgets/itemCount.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// enum SinginCharacter { fill, outline }

class FoodOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final String productIcon;
  final String productDescription;
  final double productRating;
  final String itemName;
  final String caloryCount;
  FoodOverview({
    required this.productId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productIcon,
    required this.productDescription,
    required this.productRating,
    required this.itemName,
    required this.caloryCount,
  });

  @override
  _FoodOverviewState createState() => _FoodOverviewState();
}

class _FoodOverviewState extends State<FoodOverview> {
  // SinginCharacter _character = SinginCharacter.fill;

  Widget bottomNavigatorBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String? title,
    IconData? iconData,
    Function()? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // bool wishListBool = false;

  // getWishtListBool() {
  //   FirebaseFirestore.instance
  //       .collection("WishList")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .collection("YourWishList")
  //       .doc(widget.productId)
  //       .get()
  //       .then((value) => {
  //             if (this.mounted)
  //               {
  //                 if (value.exists)
  //                   {
  //                     setState(
  //                       () {
  //                         wishListBool = value.get("wishList");
  //                       },
  //                     ),
  //                   }
  //               }
  //           });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    // WishListProvider wishListProvider = Provider.of(context);
    // getWishtListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: primaryColour,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "Add To WishList",
            // iconData: wishListBool == false
            //     ? Icons.favorite_outline
            //     : Icons.favorite,
            // onTap: () {
            //   setState(() {
            //     wishListBool = !wishListBool;
            //   });
            //   if (wishListBool == true) {
            //     wishListProvider.addWishListData(
            //       wishListId: widget.productId,
            //       wishListImage: widget.productImage,
            //       wishListName: widget.productName,
            //       wishListPrice: widget.productPrice,
            //       wishListQuantity: 2,

            //     );
            //   } else {
            //     wishListProvider.deleteWishtList(widget.productId);
            //   }
            // }
          ),
          bottomNavigatorBar(
              backgroundColor: primaryColour,
              color: Colors.white70,
              iconColor: Colors.white70,
              title: "Go To Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Get.to(
                  () => ReviewCart(),
                );
              }),
        ],
      ),
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text(
          "Food Overview",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.network(
                              widget.productIcon,
                              height: 30,
                              width: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.productName,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: height / 3,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    width: double.infinity,
                    child: Text(
                      "Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            // Radio(
                            //   // value: SinginCharacter.fill,
                            //   // groupValue: _character,
                            //   activeColor: Colors.green[700],
                            //   onChanged: (value) {
                            //     setState(() {
                            //       _character=value;
                            //     });
                            //   },
                            // ),
                          ],
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                    color: Colors.red[700], fontSize: 18),
                              ),
                              Text(
                                '${widget.productPrice}',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ItemCount(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productPrice: widget.productPrice,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.itemName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800, fontSize: 22),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.amber[400],
                              ),
                              Text(
                                '${widget.caloryCount}',
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "images/star.svg",
                            width: 20,
                            height: 21,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.productRating}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.productDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
