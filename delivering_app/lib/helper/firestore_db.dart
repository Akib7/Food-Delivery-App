import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivering_app/Constants/firebase_auth_constants.dart';

class FirStoreDB {
  static addUser(String email, String userName, String typeOfUser) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      'email': email,
      'userName': userName,
      'typeOfUser': typeOfUser,
      'createdOn': Timestamp.now(),
    });
  }
}
