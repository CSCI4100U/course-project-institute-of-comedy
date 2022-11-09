<<<<<<< HEAD:zamazon/lib/SignUp.dart
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
                style: const TextStyle(fontSize: 30),
              ),
            ),
            TextFormField(//Name Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Input your name',
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Name';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Name';
                }
                return null;
              },
            ),
            TextFormField(//Email Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Email example: abc@gmail.com',
              ),
              validator: (value) {
                RegExp regExp = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Email';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Email';
                }
                return null;
              },
            ),
            TextFormField(//Password Validator
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'At least 6 letters:'
                            ' 1 Uppercase, 1 Lowercase, 1 num'),
              validator: (value) {
                RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Password';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Password';
                }
                return null;
              },
            ),
            ElevatedButton(
              //Confirmed sign up and return to home page as logged in user
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("User Registered!",
                              style: TextStyle(fontSize: 20),
                            )
                        ),
                    );
                    Navigator.pushNamed(context, '/CustomerAddress');
                  }
                },
                child: Text('Continue')
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';
import 'package:zamazon/imgurLinks.dart';

class SignUpWidget extends StatefulWidget {
  SignUpWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
>>>>>>> 5f53fac7a9a50f3bf4ca70988850526aff6a306e:zamazon/lib/controllers/SignUp.dart
