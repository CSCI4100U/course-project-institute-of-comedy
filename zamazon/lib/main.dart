import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/controllers/CustomerInfoForm.dart';
import 'package:zamazon/controllers/SignInForm.dart';
import 'package:zamazon/models/CusUser.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/views/checkoutPage.dart';
import 'package:zamazon/views/homePage.dart';
import 'package:zamazon/views/ShoppingCartPage.dart';
import 'package:zamazon/controllers/SignUpForm.dart';
import 'package:zamazon/views/WishListPage.dart';
import 'package:zamazon/models/productModel.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/controllers/userProfilePage.dart';

// main file of app. firebase and streamprovider for products are initialized here.
// Streambuilder listens to authentification state changes, and displays either the
// signin page or homepage accordingly.

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.signOut();

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
              ? const HomePage()
              : const SignInWidget(
                  title: 'Welcome \n Please Sign In',
                ),
          onGenerateRoute: (settings) {
            final String routeName = settings.name!;
            final Map<String, dynamic> arguments =
                settings.arguments as Map<String, dynamic>;

            switch (routeName) {
              case '/ProductPage':
                return MaterialPageRoute(builder: (context) {
                  // Product product = arguments;
                  return ProductPage(
                    title: arguments['title'],
                    product: arguments['product'],
                  );
                });
              case '/CheckOut':
                return MaterialPageRoute(builder: (context) {
                  return CheckOutPage(
                    title: arguments['title'],
                    checkOutItems: arguments['checkOutItems'],
                    sumOfCart: arguments['sumOfCart'],
                    numOfItems: arguments['numOfItems'],
                  );
                });
              default:
                return MaterialPageRoute(
                    builder: (context) => const HomePage());
            }
          },
          routes: {
            //Routes to other pages
            '/CustomerInfo': (context) =>
                const CustomerAddressWidget(title: 'Enter Address Info'),
            '/SignIn': (context) => const SignInWidget(title: 'Sign In'),
            '/SignUp': (context) => const SignUpWidget(title: 'Sign Up'),
          },
        );
      },
    );
  }
}
