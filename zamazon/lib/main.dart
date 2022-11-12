import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/controllers/CustomerAddressForm.dart';
import 'package:zamazon/controllers/SignInForm.dart';
import 'package:zamazon/views/homePage.dart';
import 'package:zamazon/views/ShoppingCartPage.dart';
import 'package:zamazon/controllers/SignUpForm.dart';
import 'package:zamazon/views/WishListPage.dart';
import 'package:zamazon/models/productModel.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        // PROVIDES LIST OF ALL PRODUCTS FROM FIRESTORE
        StreamProvider<List<Product>>(
          create: (context) => ProductModel().getProducts(),
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
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'Zamazon Demo',
          theme: ThemeData.light(),
          home: (snapshot.hasData)
              ? const HomePage(title: 'Zamazon')
              : const SignInWidget(
                  title: 'Welcome \n Please Sign In',
                ),
          onGenerateRoute: (settings) {
            var arguments = settings.arguments as ProductPage;

            switch (settings.name) {
              case '/ProductPage':
                return MaterialPageRoute(builder: (context) {
                  // Product product = arguments;
                  return ProductPage(
                    title: arguments.title,
                    product: arguments.product,
                  );
                });
              default:
                return MaterialPageRoute(
                    builder: (context) => const HomePage(title: 'Zamazon'));
            }
          },
          routes: {
            //Routes to other pages
            '/CustomerAddress': (context) => CustomerAddressWidget(
                  title: 'Enter Address Info',
                ),
            '/SignIn': (context) => SignInWidget(title: 'Sign In'),
            '/SignUp': (context) => SignUpWidget(title: 'Sign Up'),
            '/ShoppingCart': (context) => ShoppingCartPage(title: 'Shopping Cart'),
            '/WishList': (context) => WishWidget(title: 'Wish List'),
          },
        );
      },
    );
  }
}
