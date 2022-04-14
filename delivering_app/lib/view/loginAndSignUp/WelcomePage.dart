import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/widgets/LoginForm.dart';
import 'package:delivering_app/widgets/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(       
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: SvgPicture.asset(
              "images/delivery.svg",
              width: 170,
              height: 150,
              ),
            ),
          ),
          Text('Welcome', style: TextStyle(fontSize: 40,
          fontWeight: FontWeight.bold),),
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