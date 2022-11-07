import 'package:flutter/material.dart';

import 'ShoppingCart.dart';
import 'SignIn.dart';
import 'SignUp.dart';
import 'WishList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zamazon Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zamazon Demo Home Page'),
      routes: {//Routes to other pages
        '/SignIn': (context) => SignInWidget(title:'SignIn'),
        '/SignUp': (context) => SignUpWidget(title:'SignUp'),
        '/ShoppingCart': (context) => CartWidget(title:'Shopping Cart'),
        '/WishList': (context) => WishWidget(title:'Wish List'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(//Button to access Shopping Cart
              onPressed: (){
              Navigator.pushNamed(context, '/ShoppingCart');},
              icon: Icon(Icons.shopping_cart))
        ],
      ),
    );
  }
}
