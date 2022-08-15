import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/models/deliver_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isLoading = false;
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternativeMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pinCode = TextEditingController();
  LocationData? setLocation;

  getSnackBar(String text) {
    return Get.snackbar(
      'Denied',
      text,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primaryColour,
      colorText: Colors.white,
      margin: EdgeInsets.all(15),
    );
  }

  void validator(myType) async {
    if (firstName.text.isEmpty) {
      getSnackBar('First Name is empty');
    } else if (lastName.text.isEmpty) {
      getSnackBar('Last Name is empty');
    } else if (mobileNo.text.isEmpty) {
      getSnackBar('Mobile No. is empty');
    } else if (alternativeMobileNo.text.isEmpty) {
      getSnackBar('Alternative Mobile No. is empty');
    } else if (society.text.isEmpty) {
      getSnackBar('Society is empty');
    } else if (street.text.isEmpty) {
      getSnackBar('Street is empty');
    } else if (landmark.text.isEmpty) {
      getSnackBar('Landmark is empty');
    } else if (city.text.isEmpty) {
      getSnackBar('City is empty');
    } else if (area.text.isEmpty) {
      getSnackBar('Area is empty');
    } else if (pinCode.text.isEmpty) {
      getSnackBar('PinCode is empty');
    } else if (setLocation == null) {
      getSnackBar('Location is empty');
    }
    // else if (setLocation.text.isEmpty) {
    //   Get.snackbar(
    //     'Denied',
    //     'Location is empty',
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: primaryColour,
    //     colorText: Colors.white,
    //     margin: EdgeInsets.all(15),
    //   );
    // }
    else {
      isLoading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection('AddDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'mobileNo': mobileNo.text,
        'alternativeMobileNo': alternativeMobileNo.text,
        'society': society.text,
        'street': street.text,
        'landmark': landmark.text,
        'city': city.text,
        'area': area.text,
        'pinCode': pinCode.text,
        'latitude': setLocation!.latitude,
        'longitude': setLocation!.longitude,
        'addressType': myType.toString(),
      }).then((value) => {
                isLoading = false,
                notifyListeners(),
                Get.back(),
                Get.snackbar(
                  'Success',
                  'Add your Delivery Address',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: primaryColour,
                  colorText: Colors.white,
                  margin: EdgeInsets.all(15),
                ),
                notifyListeners(),
              });
      notifyListeners();
    }
  }

  List<DeliveryAddress> deliverAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddress> newList = [];

    DeliveryAddress deliveryAddress;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection('AddDeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (_db.exists) {
      deliveryAddress = DeliveryAddress(
        firstName: _db.get('firstName'),
        lastName: _db.get('lastName'),
        mobileNo: _db.get('mobileNo'),
        alternativeMobileNo: _db.get('alternativeMobileNo'),
        society: _db.get('society'),
        street: _db.get('street'),
        landmark: _db.get('landmark'),
        city: _db.get('city'),
        area: _db.get('area'),
        pinCode: _db.get('pinCode'),
        addressType: _db.get('addressType'),
      );
      newList.add(deliveryAddress);
      notifyListeners();
    }
    deliverAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddress> get getDeliveryAddressDataList {
    return deliverAddressList;
  }
}
