import 'package:cloud_firestore/cloud_firestore.dart';

// Class for the items in someone's shoppingcart or wishlist.
// Only some information about the product is required for this so
// we chose to make it a new class specifically for populating the ui of
// the shopping cart and wishlist. dunno if this is a good way to do this.

class ShoppingCartWishListItem {
  DocumentReference? docRef;
  String? title;
  String? imageURL;
  int? quantity;
  int? size;
  double? price;

  ShoppingCartWishListItem(
      {this.docRef,
      this.title,
      this.imageURL,
      this.quantity,
      this.size,
      this.price});

  ShoppingCartWishListItem.fromMap(Map map, {required this.docRef}) {
    this.title = map['title'];
    this.imageURL = map['imageURL'];
    this.quantity = map['quantity'];
    this.size = map['size'];
    this.price = map['price'];
  }

  Map<String, Object?> fromMap() {
    return {
      'title': this.title,
      'imageURL': this.imageURL,
      'quantity': this.quantity,
      'size': this.size,
      'price': this.price,
    };
  }

  @override
  String toString() {
    return 'ShoppingCartWishListItem{'
        'title: $title, '
        'imageURL: $imageURL, '
        'quantity: $quantity, '
        'size: $size, '
        'price: $price}';
  }
}
