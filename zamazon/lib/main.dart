import 'package:flutter/material.dart';
import 'CustomerAddress.dart';
import 'SignIn.dart';
import 'homePage.dart';
import 'ShoppingCart.dart';
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
      theme: ThemeData.light(),
      home: const HomePage(title: 'Zamazon'),
      routes: {
        //Routes to other pages
        '/CustomerAddress': (context) => CustomerAddressWidget(title: 'Customer Address'),
        '/SignIn': (context) => SignInWidget(title: 'Sign In'),
        '/SignUp': (context) => SignUpWidget(title: 'Sign Up'),
        '/ShoppingCart': (context) => CartWidget(title: 'Shopping Cart'),
        '/WishList': (context) => WishWidget(title: 'Wish List'),
      },
    );
  }
}
