import 'package:flutter/material.dart';
import 'package:zamazon/authentication/authFunctions.dart';
import 'package:zamazon/authentication/regexValidation.dart';

// Form presented to user after they sign up. Asks for location info and name.

class CustomerAddressWidget extends StatefulWidget {
  const CustomerAddressWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<CustomerAddressWidget> createState() => _CustomerAddressState();
}

class _CustomerAddressState extends State<CustomerAddressWidget> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();

  String? _name;
  String? _country;
  String? _province;
  String? _city;
  String? _postal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      'Enter Shipping Info',
                      style: TextStyle(fontSize: 30),
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
                      onSaved: (name) {
                        _name = name;
                      },
                      validator: (value) {
                        return RegexValidation().validateNoNums('name', value);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      //Country Validator
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.language),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'Country',
                      ),
                      onSaved: (country) {
                        _country = country;
                      },
                      validator: (value) {
                        return RegexValidation()
                            .validateNoNums('country', value);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      //Province Validator
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.landscape),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'Province',
                      ),
                      onSaved: (province) {
                        _province = province;
                      },
                      validator: (value) {
                        return RegexValidation()
                            .validateNoNums('province', value);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      //City Validator
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'City',
                      ),
                      onSaved: (city) {
                        _city = city;
                      },
                      validator: (value) {
                        return RegexValidation().validateNoNums('city', value);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      //Postal Code Validator
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.house),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: 'Postal Code',
                      ),
                      onSaved: (postal) {
                        _postal = postal;
                      },
                      validator: (value) {
                        return RegexValidation().validatePostal(value);
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepOrangeAccent),
                    child: TextButton(
                        //Confirmed sign up and return to home page as logged in user
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            _auth.addUserInfo(_name!, _country!, _province!,
                                _city!, _postal!);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                "Info Saved!",
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
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 30))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
