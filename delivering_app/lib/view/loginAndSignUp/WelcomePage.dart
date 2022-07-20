import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/widgets/LoginForm.dart';
import 'package:delivering_app/widgets/SignUp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/lottie fles/my_lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyLottie(),
          Text(
            'Welcome',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColour,
            ),
            onPressed: () {
              Get.to(() => LoginForm());
            },
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColour,
            ),
            onPressed: () {
              Get.to(() => SignUPage());
            },
            child: const Text(
              "Signup",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
