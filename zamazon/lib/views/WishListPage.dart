import 'package:flutter/material.dart';

// IN PROGRESS, similar to shopping cart page, except users will only be able to
// add wishlist items to shopping cart, they will not be able to check out items
// from this page.

class WishListPage extends StatefulWidget {
  WishListPage({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  //TODO
  // might track shopping cart and wishlist using provider?
  // List<Product> wishList = ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/ShoppingCart'),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Container(
        //Empty
        alignment: Alignment.center,

        //TODO listview of wishlist items
        child: const Text(
          'Wish list is empty - WIP',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
