import 'package:flutter/material.dart';
import 'package:zamazon/createAppBar.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key, this.title}) : super(key: key);

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
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                '${widget.title}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Email example: abc@gmail.com',
              ),
              validator: (value) {
                //validateEmail(value);   //AT THE BOTTOM, NEED REGEX
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Atleast 6 letters with 1 number.'),
              validator: (value) {
                //validatePassword(value);   //AT THE BOTTOM, NEED REGEX
              },
            ),
            ElevatedButton(
              //Confirmed sign up and return to home page as logged in user
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }

  String? validateEmail(String value) {
    // regex currently wrong, need to fix.
    RegExp regExp = RegExp(r'');
  }

  String? validatePassword(String value) {
    // regex currently wrong, need to fix.
    RegExp regExp = RegExp(r'(?=.*[A-Z])(?=.*[a-z]).{8,}(?=.*[0-9])');
    if (value.isEmpty) {
      return 'Please enter a password';
    } else {
      if (!regExp.hasMatch(value)) {
        return 'Password must have atleast 6 letters and 1 number.';
      } else {
        return null;
      }
    }
  }
}