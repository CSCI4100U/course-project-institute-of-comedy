//SHOPPING CART WISH LIST MODEL
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';

class SCWLModel {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<List<ShoppingCartWishListItem>> getUserShoppingCartWishList(
      String collName) {
    User? currUser = _auth.currentUser;

    return _db
        .collection('users')
        .doc(currUser!.uid)
        .collection(collName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((document) {
        return ShoppingCartWishListItem.fromMap(document.data(),
            docRef: document.reference);
      }).toList();
    });
  }
}
