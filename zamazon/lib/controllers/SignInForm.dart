import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/zamazonLogo.dart';

import '../themes.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final ContainerTheme = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey[900]
        : Colors.white;

    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: ContainerTheme,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                //TODO Change this to validate existing Email
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
                //TODO Change this to validate existing Password
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
                        labelText: 'Password'),
                    validator: (value) {
                      RegExp regExp = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'At least 6 letters:'
                            ' 1 Uppercase, 1 Lowercase, 1 Number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //TODO Change this to validate accounts
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrangeAccent),
                  child: TextButton(
                      //Confirmed sign up and return to home page as logged in user
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                              "Log in successfully",
                              style: TextStyle(fontSize: 20),
                            )),
                          );
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
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
                      surfaceTintColor: Colors.red,
                      textStyle: const TextStyle(
                          fontSize: 15, decoration: TextDecoration.underline),
                    ),
                    child: const Text('Create a account'),
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
