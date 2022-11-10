import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  CartWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
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
              icon: Icon(Icons.favorite))
        ],
      ),
      body: Column(children: [
        Expanded(
            child: SingleChildScrollView(
                child: Column(
          children: [
            Padding(
              //Button to access Sign In Page
              padding: const EdgeInsets.only(left: 100, top: 250),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignIn');
                },
                child: Text('Sign in to your Account'),
              ),
            ),
          ],
        )))
      ]),
    );
  }
}
