import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/views/ShoppingCartPage.dart';
import 'package:zamazon/views/WishListPage.dart';
import 'package:zamazon/views/homePage.dart';
import 'controllers/CustomerAddressForm.dart';
import 'controllers/SignInForm.dart';
import 'controllers/SignUpForm.dart';
import 'package:zamazon/views/homePage.dart';
import 'package:zamazon/controllers/SignUpForm.dart';
import 'package:zamazon/views/WishListPage.dart';
import 'models/Product.dart';
import 'models/productStreamProvider.dart';

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
