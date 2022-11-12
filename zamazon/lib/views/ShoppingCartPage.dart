import 'package:flutter/material.dart';

//IN PROGRESS, users should be able to add/remove items to their shopping carts
// and they will be displayed in this page. IN PROGRESS, checking out items.

class CartWidget extends StatefulWidget {
  CartWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
              //Access the Wishlist Page
              onPressed: () {
                Navigator.pushNamed(context, '/WishList');
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: Container(
        //Empty
        alignment: Alignment.center,

        //TODO listview of wishlist items
        child: const Text(
          'Shopping cart is empty - WIP',
          softWrap: true,
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
