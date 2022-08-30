import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/controller/Providers/reviewCartProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SearchItem extends StatefulWidget {
  bool isBool = false;
  final String productImage;
  final String productName;
  final int productPrice;
  final String productId;
  final int productQuantity;
  Function()? onDelete;
  SearchItem({
    required this.isBool,
    required this.productId,
    required this.productQuantity,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    this.onDelete,
  });
  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  late ReviewCartProvider reviewCartProvider;

  int count = 1;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  void addItem() {
    if (count == 10) return;
    setState(() {
      count++;
    });
  }

  void removeItem() {
    if (count == 0) return;
    setState(() {
      count--;
    });
  }

  getSnackBar() {
    Get.snackbar(
      "Request can not be processed",
      "You have reached the minimum limit",
      icon: Icon(Icons.production_quantity_limits, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primaryColour,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  getSnackBarAdd() {
    Get.snackbar(
      "Request can not be processed",
      "You can not take more than 6 items",
      icon: Icon(Icons.production_quantity_limits, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primaryColour,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(widget.productImage),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 90,
                    child: Column(
                      mainAxisAlignment: widget.isBool
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.productName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${widget.productPrice}\$/pc',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        widget.isBool
                            ? Container(
                                height: 35,
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '50\$',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColour,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Text('2Pcs'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                      height: 100,
                      padding: widget.isBool
                          ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                          : EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                      child: widget.isBool
                          ? Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 20,
                                    color: primaryColour,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(
                                      color: primaryColour,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: widget.onDelete,
                                    child: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (count == 1) {
                                              getSnackBar();
                                            } else {
                                              removeItem();
                                              reviewCartProvider
                                                  .updateReviewCartrData(
                                                cartId: widget.productId,
                                                cartImage: widget.productImage,
                                                cartName: widget.productName,
                                                cartPrice: widget.productPrice,
                                                cartQuantity: count,
                                              );
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: primaryColour,
                                          ),
                                        ),
                                        Text(
                                          '$count',
                                          style: TextStyle(
                                            color: primaryColour,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (count < 6) {
                                              addItem();
                                              reviewCartProvider
                                                  .updateReviewCartrData(
                                                cartId: widget.productId,
                                                cartImage: widget.productImage,
                                                cartName: widget.productName,
                                                cartPrice: widget.productPrice,
                                                cartQuantity: count,
                                              );
                                            } else {
                                              getSnackBarAdd();
                                            }
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: primaryColour,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                ),
              ],
            ),
          ),
        ),
        widget.isBool
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              ),
      ],
    );
  }
}
