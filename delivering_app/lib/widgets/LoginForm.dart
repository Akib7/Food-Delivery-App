// ignore_for_file: file_names

import 'package:delivering_app/Constants/firebase_auth_constants.dart';
import 'package:delivering_app/config/constants.dart';
import 'package:delivering_app/widgets/constants.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class EmailFieldValidator {
  static String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Email can\'t be empty';
    }
    if (!RegExp(
            r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
        .hasMatch(value)) {
      return 'Please enter a valid Email';
    }
    return null;
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String name = "", email = "", phone = "";
  TextEditingController emailText = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                // color: login_color,
                child: TextFormField(
                  controller: emailText,
                  keyboardType: TextInputType.text,
                  validator: EmailFieldValidator.validate,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Material(
                  // color: login_color,
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
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: primaryColour,
                ),
                onPressed: () {
                  if (formkey.currentState != null &&
                      formkey.currentState!.validate()) {
                    print("Login Successful");
                    authController.login(
                        emailText.text.trim(), password.text.trim());
                  } else {
                    print("Login Unsuccessful");
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Material(
                color: Colors.white,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
