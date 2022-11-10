import 'package:flutter/material.dart';

class SignInWidget extends StatefulWidget {
  SignInWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 150, bottom: 10),
            child: Text(
              'Signing In',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Padding(
            //Input form for Email
            padding: EdgeInsets.only(top: 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Email example: abc@gmail.com'),
            ),
          ),
          Padding(
            //Input form for Password
            padding: EdgeInsets.only(bottom: 0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Atleast 6 letters with 1 number.'),
            ),
          ),
          ElevatedButton(
              //Confirmed sign in and return to home page as logged in user
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Continue'))
        ],
      ),
    );
  }
}
