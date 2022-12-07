import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/authentication/authFunctions.dart';
import 'package:zamazon/globals.dart';
import '../authentication/regexValidation.dart';
import '../themes.dart';

// Form for registering a new user to firebase.

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    final containerTheme = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey[900]
        : Colors.white;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: containerTheme,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(zamazonLogo),
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Email Validator
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Email',
                    ),
                    onSaved: (email) {
                      _email = email;
                    },
                    validator: (value) {
                return RegexValidation().validateEmail(value);
                },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Password Validator
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      errorMaxLines: 10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Password',
                    ),
                    onSaved: (password) {
                      _password = password;
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          _auth.signUp(_email, _password).then((_) {
                            Navigator.pushNamed(
                              context,
                              "/NewUserInfoPage"
                            );
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Continue',
                          style: TextStyle(fontSize: 20))),
                ),
                TextButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    surfaceTintColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
