import 'package:flutter/material.dart';
import 'package:zamazon/createAppBar.dart';
import 'package:email_validator/email_validator.dart';

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
                validateEmail(value!);   //AT THE BOTTOM, NEED REGEX
              },
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Atleast 6 letters with 1 number.'),
              validator: (value) {
                validatePassword(value!);   //AT THE BOTTOM, NEED REGEX
              },
            ),
            ElevatedButton(
              //Confirmed sign up and return to home page as logged in user
                onPressed: () {
                  if (formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Succeed'))
                    );
                  }else {
                    print('Failed');
                    //Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                },
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }

  String? validateEmail(String value) {
    // regex currently wrong, need to fix.
    RegExp regExp = RegExp(
        "r'^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+'");
    if (value.isEmpty) {
      return 'Please enter a Email';
    } else {
      if (!regExp.hasMatch(value)) {
        return 'Please enter a valid Email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    // regex currently wrong, need to fix.
    RegExp regExp = RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{6,}$');
    if (value.isEmpty) {
      return 'Please enter a password';
    } else {
      if (!regExp.hasMatch(value)) {
        return 'Password requires 1 upper case, 1 lower case, 1 number, 1 special character'
                'and at least 6 characters total';
      } else {
        return null;
      }
    }
  }
}