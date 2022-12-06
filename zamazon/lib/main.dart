import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/themes.dart';
import 'package:zamazon/views/ProductPage.dart';
import 'package:zamazon/views/SettingsPage.dart';
import 'package:zamazon/views/checkoutPage.dart';
import 'package:zamazon/views/homePage.dart';
import 'controllers/CustomerAddressForm.dart';
import 'controllers/SignInForm.dart';
import 'controllers/SignUpForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zamazon/models/Product.dart';
import 'package:zamazon/models/productModel.dart';
import 'package:zamazon/models/theme_model.dart';
import 'themes.dart';

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
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return MaterialApp(
              title: 'Zamazon Demo',
              themeMode: themeProvider.getCurrentTheme(),
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
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
                '/SettingsPage': (context) =>
                    const SettingsPageWidget(title: 'Settings'),
                '/CustomerInfo': (context) =>
                    const CustomerAddressWidget(title: 'Enter Address Info'),
                '/SignIn': (context) => const SignInWidget(title: 'Sign In'),
                '/SignUp': (context) => const SignUpWidget(title: 'Sign Up'),
              },
              localizationsDelegates: [
                FlutterI18nDelegate(
                  missingTranslationHandler: (key, locale) {
                    print(
                        "MISSING KEY: $key, Language Code: ${locale!.languageCode}");
                  },
                  translationLoader: FileTranslationLoader(
                      useCountryCode: false,
                      fallbackFile: 'en',
                      basePath: 'assets/i18n'
                  ),
                ),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('en'),
                Locale('fr'),
              ],
            );
          },
        );
      },
    );
  }
}
