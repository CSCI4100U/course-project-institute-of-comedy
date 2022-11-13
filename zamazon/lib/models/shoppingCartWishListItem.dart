import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Product.dart';

class ShoppingCartWishListItem {
  DocumentReference? docRef;
  String? productId;
  int? quantity;
  int? size;
  double? price;

  ShoppingCartWishListItem(
      {this.docRef, this.productId, this.quantity, this.size, this.price});

  ShoppingCartWishListItem.fromMap(Map map, {required this.docRef}) {
    this.productId = map['productId'];
    this.quantity = map['quantity'];
    this.size = map['size'];
    this.price = map['price'];
  }

  Map<String, Object?> fromMap() {
    return {
      'productId': this.productId,
      'quantity': this.quantity,
      'size': this.size,
      'price': this.price,
    };
  }

  @override
  String toString() {
    return 'ShoppingCartWishListProduct{docRef: $docRef,'
        ' productId: $productId, '
        'quantity: $quantity, '
        'size: $size, '
        'price: $price}';
  }

  // Product findProduct(BuildContext context) {
  //   List<Product> productList = Provider.of<List<Product>>(context);
  //
  //   return;
  // }


}