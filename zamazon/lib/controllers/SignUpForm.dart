import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final zamazonLogo = 'https://i.imgur.com/Ty5m1io.png';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
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
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    //Name Validator
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Name';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid Name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 20,
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
                    validator: (value) {
                      RegExp regExp =
                          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Password';
                      } else if (!regExp.hasMatch(value)) {
                        return 'At least 6 letters: 1 Uppercase, 1 Lowercase, and 1 Number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                              "User Registered!",
                              style: TextStyle(fontSize: 20),
                            )),
                          );
                          Navigator.pushNamed(context, '/CustomerAddress');
                        }
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      child:
                          const Text('Continue', style: TextStyle(fontSize: 30))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
