import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/zamazonLogo.dart';

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
    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      body: SingleChildScrollView(
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
              //TODO Change this to validate existing Email
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  //Email Validator
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Email',
                    hintText: 'Email example: abc@gmail.com',
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(
                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Email';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid Email';
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
                      errorMaxLines: 10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      labelText: 'Password',
                      hintText: 'At least 6 letters:'
                          ' 1 Uppercase, 1 Lowercase, 1 num'),
                  validator: (value) {
                    RegExp regExp =
                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Password';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Valid password requires 1 Uppercase, 1 Lowercase, and 1 Number';
                    }
                    return null;
                  },
                ),
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
                    child:
                        const Text('Continue', style: TextStyle(fontSize: 30))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
