import 'package:delivering_app/Constants/firebase_auth_constants.dart';
import 'package:delivering_app/config/constants.dart';

import 'package:delivering_app/view/loginAndSignUp/WelcomePage.dart';
import 'package:delivering_app/widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUPage extends StatefulWidget {
  static String userName = '';
  const SignUPage({Key? key}) : super(key: key);

  @override
  State<SignUPage> createState() => _SignUPageState();
}

class _SignUPageState extends State<SignUPage> {
  String name = "", email = "", phone = "", typeOfUser = '';
  TextEditingController typeOfUserText = TextEditingController();
  TextEditingController emailText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Form(
        key: formkey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 3,
            ),
            child: Column(
              children: [
                const Spacer(
                    // flex: 2,
                    ),
                Material(
                  child: TextFormField(
                    controller: typeOfUserText,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter which type of user are you?';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      if (value == null || value.isEmpty) {
                        typeOfUser = value.toString();
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Type of User",
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: defaultPadding),
                  child: Material(
                    child: TextFormField(
                      controller: nameText,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter User name';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        if (value == null || value.isEmpty) {
                          name = value.toString();
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "User Name",
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: Material(
                    child: TextFormField(
                      controller: emailText,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        if (!RegExp(
                                r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                            .hasMatch(value)) {
                          return 'Please enter a valid Email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value == null || value.isEmpty) {
                          email = value.toString();
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                  ),
                ),
                Material(
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      }
                      if (value.length <= 6) {
                        return "Password should not be less that 6 characters";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Material(
                    child: TextFormField(
                      obscureText: true,
                      controller: confirmPassword,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter Password again";
                        }
                        if (value.length <= 6) {
                          return "Password should not be less that 6 characters";
                        }
                        if (password.text != confirmPassword.text) {
                          return "Password does not match";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Confirm Password",
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColour,
                  ),
                  onPressed: () {
                    if (formkey.currentState != null &&
                        formkey.currentState!.validate()) {
                      print("Login Successful");
                      authController.signup(
                        emailText.text.trim(),
                        password.text.trim(),
                        nameText.text.trim(),
                        typeOfUserText.text.trim(),
                      );
                    } else {
                      print("Login Unsuccessful");
                    }
                    // Get.to(() => const MyHomePage());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MyHomePage(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(
                      () => const WelcomePage(),
                    );
                  },
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     "Forgot Password?",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
