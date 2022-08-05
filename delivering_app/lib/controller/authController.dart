import 'package:delivering_app/Constants/firebase_auth_constants.dart';

import 'package:delivering_app/helper/firestore_db.dart';
import 'package:delivering_app/view/MyHomePage.dart';
import 'package:delivering_app/view/loginAndSignUp/WelcomePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // UserProvider userProvider = Provider.of<UserProvider>(context);
  late Rx<User?> firebaseUser;
  static AuthController instance = Get.find<AuthController>();

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
    } else {
      Get.offAll(() => MyHomePage(
            onTap: () {},
          ));
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
