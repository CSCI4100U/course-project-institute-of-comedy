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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Name',
                    hintText: 'Input your name',
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
              const SizedBox(
                height: 20,
              ),
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
    );
  }
}
