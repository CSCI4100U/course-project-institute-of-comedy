import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'CustomerAddress.dart';
import 'SignIn.dart';
import 'homePage.dart';
import 'ShoppingCart.dart';
import 'SignUp.dart';
import 'WishList.dart';
=======
import 'package:zamazon/models/productStreamProvider.dart';
import 'views/homePage.dart';
import 'views/ShoppingCart.dart';
import 'controllers/SignUp.dart';
import 'views/WishList.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
>>>>>>> 5f53fac7a9a50f3bf4ca70988850526aff6a306e

void main() {
  runApp(
    MultiProvider(
      providers: [
        // PROVIDES LIST OF ALL PRODUCTS FROM FIRESTORE
        StreamProvider<List<Product>>(
          create: (context) => ProductStreamProvider().getProducts(),
          initialData: const [],
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
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
=======
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Error Initializing Firebase");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print("Successfully connected to Firebase");
          return MaterialApp(
            title: 'Zamazon Demo',
            theme: ThemeData.light(),
            home: const HomePage(title: 'Zamazon'),
            onGenerateRoute: (settings) {
              var arguments = settings.arguments as ProductPage;

              switch (settings.name) {
                case '/ProductPage' :
                  return MaterialPageRoute(
                      builder: (context) {
                        // Product product = arguments;
                        return ProductPage(
                          title: arguments.title,
                          product: arguments.product,
                        );
                      }
                  );
                default :
                  return MaterialPageRoute(
                      builder: (context) => const HomePage(title: 'Zamazon'));
              }
            },
            routes: {
              //Routes to other pages
              '/SignIn': (context) => SignUpWidget(title: 'Sign In'),
              '/SignUp': (context) => SignUpWidget(title: 'Sign Up'),
              '/ShoppingCart': (context) => CartWidget(title: 'Shopping Cart'),
              '/WishList': (context) => WishWidget(title: 'Wish List'),
            },
          );
        } else {
          return const CircularProgressIndicator();
        }
>>>>>>> 5f53fac7a9a50f3bf4ca70988850526aff6a306e
      },
    );
  }
}
