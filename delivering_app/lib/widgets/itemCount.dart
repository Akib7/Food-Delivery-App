import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/controller/Providers/reviewCartProvider.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCount extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productPrice;
  // var productUnit;

  ItemCount({
    required this.productName,
    // this.productUnit,
    required this.productId,
    required this.productImage,
    required this.productPrice,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<ItemCount> {
  int _counter = 1;
  bool isTrue = false;

  void addItem() {
    if (_counter == 10) return;
    setState(() {
      _counter++;
    });
  }

  void removeItem() {
    if (_counter == 0) return;
    setState(() {
      _counter--;
    });
  }

  getAddQuantity() {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          _counter = value.get('cartQuantity');
                          isTrue = value.get('isAdd');
                        },
                      )
                    }
                },
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddQuantity();

    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        color: primaryColour,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (_counter == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDelete(widget.productId);
                    } else if (_counter > 1) {
                      removeItem();
                      reviewCartProvider.updateReviewCartrData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: _counter,
                      );
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "$_counter",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (_counter < 6) {
                      addItem();
                      reviewCartProvider.updateReviewCartrData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: _counter,
                      );
                    }
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartrData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: _counter,
                    // cartUnit: widget.productUnit,
                  );
                },
                child: Text(
                  "Add to cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
    );
  }
}
