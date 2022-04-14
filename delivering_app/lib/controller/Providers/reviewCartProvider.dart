import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/models/reviewCartModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartrData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .set({
      'cartId': cartId,
      'cartImage': cartImage,
      'cartName': cartName,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isAdd': true,
    });
  }

  void updateReviewCartrData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .update({
      'cartId': cartId,
      'cartImage': cartImage,
      'cartName': cartName,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isAdd': true,
    });
  }

  // static checkDouble(dynamic value) {
  //   if (value is double) return value;
  //   if (value is int) return value.toDouble();
  //   if (value is String) return double.tryParse(value);
  //   return null;
  // }

  static checkInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    // return null;
  }

  List<ReviewCartModel> reviewcartdataList = [];

  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .get();

    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get('cartId'),
        cartImage: element.get('cartImage'),
        cartName: element.get('cartName'),
        cartPrice: checkInt(element.get('cartPrice')),
        cartQuantity: checkInt(
          element.get('cartQuantity'),
        ),
      );
      newList.add(reviewCartModel);
    });
    reviewcartdataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewcartdataList;
  }

  //////////////Total Price////////////////

  getTotalPrice() {
    double total = 0.0;
    reviewcartdataList.forEach((element) {
      total = total + element.cartPrice * element.cartQuantity;
    });
    return total;
  }

  /////Delete Review///////
  reviewCartDelete(cartId) {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
