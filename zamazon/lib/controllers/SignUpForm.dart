import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({super.key, this.title});

  final String? title;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateAppBar(context),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                '$title',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            TextFormField(
              //Name Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
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
            TextFormField(
              //Email Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Email example: abc@gmail.com',
              ),
              validator: (value) {
                RegExp regExp =
                    RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Email';
                } else if (!regExp.hasMatch(value)) {
                  return 'Please enter a valid Email';
                }
                return null;
              },
            ),
            TextFormField(
              //Password Validator
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'At least 6 letters:'
                      ' 1 Uppercase, 1 Lowercase, 1 num'),
              validator: (value) {
                RegExp regExp =
                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                } else if (!regExp.hasMatch(value)) {
                  return 'At least 6 letters: 1 Uppercase, 1 Lowercase, 1 num';
                }
                return null;
              },
            ),
            ElevatedButton(
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
                child: Text('Continue')),
          ],
        ),
      ),
    );
  }
}
