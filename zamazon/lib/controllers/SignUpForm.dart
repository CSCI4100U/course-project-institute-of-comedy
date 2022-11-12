import 'package:flutter/material.dart';
import 'package:zamazon/authentication/authFunctions.dart';
import 'package:zamazon/links.dart';

// Form for registering a new user to firebase.

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
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
                      RegExp regExp = RegExp(
                          r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Email';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Email example: abc@gmail.com';
                      }
                      return null;
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
                      RegExp regExp = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'At least 6 letters: 1 Uppercase, 1 Lowercase, 1 num';
                      }
                      return null;
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          signUp(context, _name, _email, _password).then((_) {
                            Navigator.pushNamed(context, '/CustomerInfo');

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                "User Registered, Welcome!",
                                style: TextStyle(fontSize: 20),
                              )),
                            );
                          });

                          //Navigator.pushNamed(context, '/CustomerAddress');
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
