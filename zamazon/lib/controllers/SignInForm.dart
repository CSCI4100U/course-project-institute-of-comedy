import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/authentication/authFunctions.dart';
import 'package:zamazon/globals.dart';
import 'package:zamazon/authentication/regexValidation.dart';
import 'package:zamazon/widgets/genericSnackBar.dart';
//Form that lets registered user's sign in.
import '../models/themeBLoC.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();
  final languages = ['en', 'fr', 'sp', 'cn', 'jp'];
  String? value;

  String? _email;
  String? _password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme =
        Provider.of<ThemeBLoC>(context).themeMode == ThemeMode.dark
            ? Colors.grey[900]
            : Colors.white;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerTheme,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(zamazonLogo),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    FlutterI18n.translate(context, "SignInForm.greeting"),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Email Validator
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText:
                          FlutterI18n.translate(context, "SignInForm.email"),
                    ),
                    onSaved: (email) {
                      _email = email!.trim();
                    },
                    validator: (value) {
                      return RegexValidation().validateEmail(value);
                    },
                  ),
                ),

                // PASSWORD FIELD
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Password Validator
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      errorMaxLines: 10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText:
                          FlutterI18n.translate(context, "SignInForm.password"),
                    ),
                    onSaved: (password) {
                      _password = password!.trim();
                    },
                    validator: (value) {
                      return RegexValidation().validatePassword(value);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrangeAccent),
                  child: TextButton(
                      //Confirmed sign up and return to home page as logged in user
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          try {
                            await _auth.signIn(_email, _password);
                            if (!mounted) return;
                            showSnackBar(
                                context,
                                FlutterI18n.translate(
                                    context, "SignInForm.snackbar_greeting"));
                          } on FirebaseAuthException catch (e) {
                            showSnackBar(
                                context,
                                FlutterI18n.translate(
                                    context, "SignInForm.snackbar_incorrect"));
                            print(e);
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black87,
                      ),
                      child: Text(
                          FlutterI18n.translate(context, "SignInForm.sign_in"),
                          style: TextStyle(fontSize: 30))),
                ),
                TextButton(
                  onPressed: () {
                    // removes cursor on previous page
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.reset();
                    Navigator.pushNamed(context, '/SignUp');
                  },
                  style: TextButton.styleFrom(
                    surfaceTintColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: Text(
                    FlutterI18n.translate(context, "SignInForm.no_account"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                DropdownButton<String>(
                    value: value,
                    iconSize: 30,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                    items: languages.map(buildMenuLang).toList(),
                    onChanged: (value) async {
                      this.value = value;
                      Locale newLocale = Locale(value!);
                      await FlutterI18n.refresh(context, newLocale);
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuLang(String lang) => DropdownMenuItem(
        value: lang,
        child: Text(
          lang,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
