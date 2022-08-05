import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:delivering_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  // void addUserData({
  //   required User currentUser,
  //   required String userName,
  //   // required String userImage,
  //   required String userEmail,
  // }) async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(currentUser.uid)
  //       .set(
  //     {
  //       "userName": userName,
  //       "userEmail": userEmail,
  //       // "userImage": userImage,
  //       "userUid": currentUser.uid,
  //     },
  //   );
  // }

  late UserModel currentData;

  void getUserData() async {
    UserModel userModel;
    var value = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        email: value.get("email"),
        // userImage: value.get("userImage"),
        userName: value.get("userName"), typeOfUser: value.get("typeOfUser"),
        // userUid: value.get("userUid"),
      );
      currentData = userModel;
      notifyListeners();
    }
  }

  UserModel get currentUserData {
    return currentData;
  }
}
