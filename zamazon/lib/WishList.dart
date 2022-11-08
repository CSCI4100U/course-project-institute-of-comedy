import 'package:flutter/material.dart';

class WishWidget extends StatefulWidget {
  WishWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<WishWidget> createState() => _WishWidgetState();
}

class _WishWidgetState extends State<WishWidget> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Container(
        //Empty
        alignment: Alignment.center,
        child: Text(
          'Wish list is empty',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
