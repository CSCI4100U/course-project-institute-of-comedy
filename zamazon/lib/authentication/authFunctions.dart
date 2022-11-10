import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future signIn(String? email, String? password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
}

Future signUp(
    BuildContext context, String? name, String? email, String? password) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!)
      .then((value) {
    Navigator.popUntil(context, (route) => route.isFirst);
  });
}

// Future userLocationInfo() async {
//   await FirebaseAuth.instance.currentUser.
// }

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}
