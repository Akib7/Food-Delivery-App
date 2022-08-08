import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/Constants/firebase_auth_constants.dart';

import 'package:delivering_app/helper/firestore_db.dart';
import 'package:delivering_app/view/MyHomePage.dart';
import 'package:delivering_app/view/loginAndSignUp/WelcomePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../view/food items/Burger.dart';

class AuthController extends GetxController {
  // UserProvider userProvider = Provider.of<UserProvider>(context);
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

  // void getUserType() async {
  //   QuerySnapshot type = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('typeOfUser')
  //       .get();
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
    }
  }

  UserModel get currentUserData {
    return currentData;
  }

  String? user = FirebaseAuth.instance.currentUser!.uid;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setIntializeScreen);
  }

  _setIntializeScreen(User? user) {
    if (user == null) {
      Get.offAll(() => WelcomePage());
    } else if (currentData.typeOfUser == 'Admin') {
      Get.offAll(() => MyHomePage(
            onTap: () {},
          ));
    } else if (currentData.typeOfUser == 'Customer') {
      Get.offAll(() => Burger());
    }
  }

  void signup(
      String email, String password, String userName, String typeOfUser) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      await FirStoreDB.addUser(email, userName, typeOfUser);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
