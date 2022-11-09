import 'package:flutter/material.dart';
import 'package:zamazon/createAppBar.dart';

class CustomerAddressWidget extends StatefulWidget {
  CustomerAddressWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<CustomerAddressWidget> createState() => _CustomerAddressState();
}

class _CustomerAddressState extends State<CustomerAddressWidget>{
  final zamazonLogo = 'https://i.imgur.com/Ty5m1io.png';
  final formKey = GlobalKey<FormState>();

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
            TextFormField(//Country Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Country',
                hintText: 'Country name',
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Country';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Country';
                }
                return null;
              },
            ),
            TextFormField(//Province Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Province',
                hintText: 'Province name',
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Province';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Province';
                }
                return null;
              },
            ),
            TextFormField(//City Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
                hintText: 'City name',
              ),
              validator: (value){
                RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                if (value == null || value.isEmpty) {
                  return 'Please enter a City';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid City';
                }
                return null;
              },
            ),
            TextFormField(//Postal Code Validator
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Postal Code',
                hintText: 'Postal Code Example: A1A 1A1 ',
              ),
              validator: (value){
                RegExp regExp = RegExp(r'/^[ABCEGHJ-NPRSTVXY]\d[ABCEGHJ-NPRSTV-Z][ -]?\d[ABCEGHJ-NPRSTV-Z]\d/i');
                if (value == null || value.isEmpty) {
                  return 'Please enter a Postal Code';
                }
                else if (!regExp.hasMatch(value)){
                  return 'Please enter a valid Postal Code';
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
                          content: Text("Address Accepted!",
                            style: TextStyle(fontSize: 20),
                          )
                      ),
                    );
                    Navigator.of(context).popUntil((route) => route.isFirst);
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