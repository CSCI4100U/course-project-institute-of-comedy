import 'package:flutter/material.dart';
import 'pages/homePage.dart';
import 'pages/ShoppingCart.dart';
import 'pages/SignUp.dart';
import 'pages/WishList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zamazon Demo',
      theme: ThemeData.light(),
      home: const HomePage(title: 'Zamazon'),
      routes: {
        //Routes to other pages
        '/SignIn': (context) => SignUpWidget(title: 'Sign In'),
        '/SignUp': (context) => SignUpWidget(title: 'Sign Up'),
        '/ShoppingCart': (context) => CartWidget(title: 'Shopping Cart'),
        '/WishList': (context) => WishWidget(title: 'Wish List'),
      },
    );
  }
}
