import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget{
  SignUpWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top:150, bottom: 10),
            child: Text('Signing Up',style: TextStyle(fontSize: 50),),
          ),
          Padding(//Input form for Email
            padding: EdgeInsets.only(top:0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Email example: abc@gmail.com'
              ),
            ),
          ),
          Padding(//Input form for Password
            padding: EdgeInsets.only(bottom:0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Atleast 6 letters with 1 number.'
              ),
            ),
          ),
          ElevatedButton(//Confirmed sign up and return to home page as logged in user
              onPressed: (){Navigator.of(context).popUntil((route) => route.isFirst);},
              child: Text('Continue')
          )
        ],
      ),
    );
  }
}
