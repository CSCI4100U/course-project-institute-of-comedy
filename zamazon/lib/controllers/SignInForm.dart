import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/links.dart';
import 'package:zamazon/authentication/authFunctions.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    '${widget.title}',
                    style: const TextStyle(fontSize: 30),
                  ),
                ),

                // EMAIL FIELD
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Email Validator
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Email',
                    ),
                    onSaved: (email) {
                      _email = email!.trim();
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

                // PASSWORD FIELD
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Password Validator
                    obscureText: true,
                    decoration: const InputDecoration(
                      errorMaxLines: 10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Password',
                    ),
                    onSaved: (password) {
                      _password = password!.trim();
                    },
                    validator: (value) {
                      RegExp regExp = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'At least 6 letters, 1 uppercase, 1 lowercase, and 1 number';
                      }
                      return null;
                    },
                  ),
                ),
                //TODO Change this to validate accounts
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrangeAccent),
                  child: TextButton(
                      //Confirmed sign up and return to home page as logged in user
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          signIn(_email, _password).then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                "Welcome back!",
                                style: TextStyle(fontSize: 20),
                              )),
                            );
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Continue',
                          style: TextStyle(fontSize: 30))),
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/SignUp');
                    },
                    style: TextButton.styleFrom(
                        surfaceTintColor: Colors.blue,
                        textStyle: TextStyle(fontSize: 15)),
                    child: const Text('No Account? Make one now.'),
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
