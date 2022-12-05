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
                child: Container(
                  margin: new EdgeInsets.all(1),
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/SignIn');
                          },
                          child: Text('Sign in to your Account'),
                        ),
                      ), //Button to access Sign Up Page
                    ],
                  ),
                )))
      ]),
    );
  }
}
