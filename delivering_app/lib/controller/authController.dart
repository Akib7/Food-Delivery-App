import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/Constants/firebase_auth_constants.dart';

import 'package:delivering_app/helper/firestore_db.dart';
import 'package:delivering_app/view/MyHomePage.dart';
import 'package:delivering_app/view/loginAndSignUp/WelcomePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../view/actors/cook.dart';
import '../view/actors/delivery_guy.dart';
import '../view/food items/Burger.dart';

class AuthController extends GetxController {
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

  var typeOfUser;
  getUserData() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final userData = userDoc.data()! as dynamic;
    print(userData);
    // String name = userData['name'];
    typeOfUser = userData['typeOfUser'];
    print(typeOfUser);
  }

  @override
  void onReady() {
    super.onReady();
    // getUserData();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setIntializeScreen);
  }

  _setIntializeScreen(User? user) async {
    await getUserData();
    if (user == null) {
      Get.offAll(() => WelcomePage());
    } else if (typeOfUser == 'Admin') {
      Get.offAll(() => MyHomePage(
            onTap: () {},
          ));
    } else if (typeOfUser == 'Customer') {
      Get.to(() => Burger());
    } else if (typeOfUser == 'Delivery Guy') {
      Get.to(() => DeliveryGuy());
    } else if (typeOfUser == 'Cook') {
      Get.to(() => Cook());
    }
  }

  void signup(
      String email, String password, String userName, String typeOfUser) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User? user = result.user;

      await FirStoreDB.addUser(email, userName, typeOfUser);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User? user = result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }
}
