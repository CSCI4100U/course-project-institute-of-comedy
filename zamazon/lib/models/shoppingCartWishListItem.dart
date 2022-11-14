import 'package:cloud_firestore/cloud_firestore.dart';

// Class for the items in someone's shoppingcart or wishlist.
// Only some information about the product is required for this so
// we chose to make it a new class specifically for populating the ui of
// the shopping cart and wishlist. dunno if this is a good way to do this.

class ShoppingCartWishListItem {
  DocumentReference? docRef;
  int? quantity;
  int? size;
  double? price;

  ShoppingCartWishListItem({this.docRef, this.quantity, this.size, this.price});

  ShoppingCartWishListItem.fromMap(Map map, {required this.docRef}) {
    this.quantity = map['quantity'];
    this.size = map['size'];
    this.price = map['price'];
  }

  Map<String, Object?> toMap() {
    return {
      'quantity': this.quantity,
      'size': this.size,
      'price': this.price,
    };
  }

  @override
  String toString() {
    return 'ShoppingCartWishListItem{'
        'quantity: $quantity, '
        'size: $size, '
        'price: $price}';
  }
}
