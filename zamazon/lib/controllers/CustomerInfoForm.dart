import 'package:flutter/material.dart';
import 'package:zamazon/authentication/authFunctions.dart';

// Form presented to user after they sign up. Asks for location info and name.

class CustomerAddressWidget extends StatefulWidget {
  const CustomerAddressWidget({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  State<CustomerAddressWidget> createState() => _CustomerAddressState();
}

class _CustomerAddressState extends State<CustomerAddressWidget> {
  final formKey = GlobalKey<FormState>();

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
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                      RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Name';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid name (No numbers)';
                      }
                      return null;
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
                      RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Country';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid Country name';
                      }
                      return null;
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
                      RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Province';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid Province name';
                      }
                      return null;
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
                      RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a City';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Please enter a valid City name';
                      }
                      return null;
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
                      RegExp regExp =
                          RegExp(r'^[A-Z][0-9][A-Z]\s[0-9][A-Z][0-9]$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter a Postal Code';
                      } else if (!regExp.hasMatch(value)) {
                        return 'Postal Code Example: A1A 1A1';
                      }
                      return null;
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          addUserInfo(
                              _name!, _country!, _province!, _city!, _postal!);

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
    );
  }
}
