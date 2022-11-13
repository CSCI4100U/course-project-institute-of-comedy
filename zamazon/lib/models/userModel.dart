import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//INPROGRESS
// model class to retrieve user information: name, email, adress.
// used for when the user wants to update their information.

class UserModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Stream the current user's personal information.
  Stream<Map<String, dynamic>> getUserInformation() {
    User? currUser = _auth.currentUser;

    return _db
        .collection('users')
        .doc(currUser!.uid)
        .snapshots()
        .map((docSnap) {
      return docSnap.data()!;
    });
  }
}
