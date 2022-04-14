import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/controller/authController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();

FirebaseAuth auth = FirebaseAuth.instance;

AuthController authController = AuthController.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
