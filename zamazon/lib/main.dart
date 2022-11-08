import 'package:flutter/material.dart';
import 'package:zamazon/models/productsListBLoC.dart';
import 'package:zamazon/pages/ProductPage.dart';
import 'pages/homePage.dart';
import 'pages/ShoppingCart.dart';
import 'pages/SignUp.dart';
import 'pages/WishList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsListBLoc()),
      ],
      child: MyApp(),
    ),
  );
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
        '/ProductPage' : (context) => ProductPage(title: 'Product'),
      },
    );
  }
}
