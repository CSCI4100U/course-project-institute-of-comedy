//SHOPPING CART WISH LIST MODEL
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zamazon/models/shoppingCartWishListItem.dart';

import 'Product.dart';

class SCWLModel {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Stream<List<ShoppingCartWishListItem>> getUserShoppingCartWishList(
      String collName) {
    return _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection(collName)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((document) {
        return ShoppingCartWishListItem.fromMap(document.data(),
            docRef: document.reference);
      }).toList();
    });
  }

  Future<void> addToCartWishList(
      Product product, String collName, {int size  = 0}) async {
    // String? docId;
    //
    // if(collName == "wishList"){
    //   docId = product.id;
    // }

    ShoppingCartWishListItem scwlItem = ShoppingCartWishListItem(
      title: product.title,
      productId: product.id,
      quantity: 1,
      size: size,
      pricePerUnit: product.price,
      totalPrice: product.price,
      sizeSelection: product.sizeSelection,
    );

    await _db
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection(collName)
        .doc(collName == "wishList" ? product.id : null)
        .set(scwlItem.toMap());
  }

  Future<void> updateCartWishList(ShoppingCartWishListItem scwlItem) async {
    await scwlItem.docRef!.update(scwlItem.toMap());
  }

  Future<void> deleteCartWishList(ShoppingCartWishListItem scwlItem) async {
    await scwlItem.docRef!.delete();
  }

  Future<Product> getProduct(String productId) async {
    return await _db.collection('products').doc(productId).get().then((value) {
      return Product.fromMap(value.data(), docRef: value.reference);
    });
  }
}