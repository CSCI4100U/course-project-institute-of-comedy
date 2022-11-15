import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:zamazon/themes.dart';
import 'package:zamazon/views/SettingsPage.dart';
import 'package:zamazon/views/ShoppingCartPage.dart';
import 'package:zamazon/views/WishListPage.dart';
import 'package:zamazon/views/homePage.dart';
import 'controllers/CustomerAddressForm.dart';
import 'controllers/SignInForm.dart';
import 'controllers/SignUpForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            title: 'Zamazon Demo',
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            home: const HomePage(title: 'Zamazon'),
            routes: {
              //Routes to other pages
              '/SettingsPage': (context) =>
                  SettingsPageWidget(title: 'Settings'),
              '/CustomerAddress': (context) =>
                  CustomerAddressWidget(title: 'Customer Address'),
              '/SignIn': (context) => SignInWidget(title: 'Sign In'),
              '/SignUp': (context) => SignUpWidget(title: 'Sign Up'),
              '/ShoppingCart': (context) => CartWidget(title: 'Shopping Cart'),
              '/WishList': (context) => WishWidget(title: 'Wish List'),
            },
          );
        },
      );
}
