import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//INPROGRESS
// model class to retrieve user information: name, adress, shoppingcart and wishlist.

class UserModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final currUser = FirebaseAuth.instance.currentUser!;

  //Stream the current user's information.
  //TODO USE THIS INFO TO POPULATE AND UPDATE SHOPPINGCART/WISHLIST
  Stream<Map<String, dynamic>> getCurrentUserMap() {
    return getCurrentUserMap();
  }

  // problems with this returning a Future<DocumentSnap<Map<String, dynamic>>
  // so I had to put it in its own function
  // May not be working properly yet.
  Future getCurrentUserDoc() async {
    return _db
        .collection('users')
        .doc(currUser.uid)
        .get()
        .then((value) => value.data());
  }
}
