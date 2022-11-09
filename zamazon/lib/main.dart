import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/models/productStreamProvider.dart';
import 'views/homePage.dart';
import 'views/ShoppingCart.dart';
import 'controllers/SignUp.dart';
import 'views/WishList.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';

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
      },
    );
  }
}
