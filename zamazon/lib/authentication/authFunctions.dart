import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Functions for creating and authenticating user's of our app

// firebase authenticating user signing
Future signIn(String? email, String? password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
}

// firebase creating and authenticating new users
Future signUp(
    BuildContext context, String? name, String? email, String? password) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
}

// add user's personal info to a document with the same id as the user's account
Future addUserInfo(String name, String country, String province, String city,
    String postal) async {
  User currUser = FirebaseAuth.instance.currentUser!;
  await FirebaseFirestore.instance.collection('users').doc(currUser.uid).set({
    'name': name,
    'email': currUser.email,
    'country': country,
    'province': province,
    'city': city,
    'postal': postal,
    'wishlist': [],
    'shoppingcart': [],
  });
}

//signout the current user
Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
