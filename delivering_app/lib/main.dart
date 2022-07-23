import 'package:delivering_app/Constants/firebase_auth_constants.dart';
import 'package:delivering_app/controller/Providers/check_out_provider.dart';
import 'package:delivering_app/controller/Providers/productProvider.dart';
import 'package:delivering_app/controller/Providers/reviewCartProvider.dart';
import 'package:delivering_app/controller/Providers/user_provider.dart';
import 'package:delivering_app/view/loginAndSignUp/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'controller/authController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: WelcomePage(),
    );
  }
}
