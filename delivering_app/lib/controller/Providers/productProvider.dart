import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/models/productModel.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> foodProductList = [];

  static checkDouble(dynamic value) {
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  static checkInt(dynamic value) {
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return int.tryParse(value);
    // return null;
  }

  late ProductModel productModel;

  fetchProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('FoodProduct').get();

    value.docs.forEach((element) {
      // print(element.data());
      productModel = ProductModel(
        productImage: element.get('productImage'),
        productName: element.get('productName'),
        productRating: checkDouble(element.get('productRating')),
        productIcon: element.get('productIcon'),
        productDescription: element.get('productDescription'),
        productPrice: checkInt(element.get('productPrice')),
        itemName: element.get('itemName'),
        caloryCount: element.get('caloryCount'),
        productId: element.get('productId'),

        //element.get('productRating'),
      );
      newList.add(productModel);
    });
    foodProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getFoodDataList {
    return foodProductList;
  }
}
