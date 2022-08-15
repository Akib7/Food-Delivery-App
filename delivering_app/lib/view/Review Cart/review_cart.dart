import 'package:delivering_app/controller/Providers/reviewCartProvider.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/models/reviewCartModel.dart';

import 'package:delivering_app/view/Checkout/deliver_details/delivery_details.dart';
import 'package:delivering_app/widgets/search_Item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  ReviewCart({Key? key}) : super(key: key);

  confirmDialog(BuildContext context, ReviewCartModel delete) {
    Get.defaultDialog(
        title: "Food Cart",
        backgroundColor: primaryColour,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        textConfirm: "Yes",
        onConfirm: () {
          reviewCartProvider.reviewCartDelete(delete.cartId);
          Get.back();
        },
        onCancel: () {
          Get.to(() => ReviewCart());
        },
        textCancel: "No",
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red,
        barrierDismissible: false,
        radius: 20,
        content: Column(
          children: [
            Container(
              child: Text(
                "Are you sure?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  showDialog(BuildContext context, ReviewCartModel delete) {
    Get.defaultDialog(
        title: "Food Cart",
        backgroundColor: primaryColour,
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        textConfirm: "Yes",
        onConfirm: () {
          // reviewCartProvider.reviewCartDelete(delete.cartId);
          Get.back();
          confirmDialog(context, delete);
        },
        textCancel: "No",
        cancelTextColor: Colors.white,
        confirmTextColor: Colors.white,
        buttonColor: Colors.red,
        barrierDismissible: false,
        radius: 20,
        content: Column(
          children: [
            Container(
              child: Text(
                "Do you want to delete this item?",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ));
  }

  getSnackBar() {
    Get.snackbar(
      "Request can not be processed",
      "No Cart Data Found",
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
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "\$ ${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: primaryColour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                getSnackBar();
              } else {
                Get.to(() => DeliverDetails());
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColour,
        title: Text(
          "Review Cart",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text('No Data'),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SearchItem(
                      isBool: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onDelete: () {
                        showDialog(context, data);
                      },
                    ),
                  ],
                );
              }),
    );
  }
}
