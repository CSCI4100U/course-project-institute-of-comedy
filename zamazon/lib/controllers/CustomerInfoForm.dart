import 'package:flutter/material.dart';
import 'package:zamazon/authentication/authFunctions.dart';
import 'package:zamazon/authentication/regexValidation.dart';
import 'package:zamazon/widgets/genericSnackBar.dart';

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
                  createTextFormField('Name', const Icon(Icons.person)),
                  createTextFormField('Country', const Icon(Icons.language)),
                  createTextFormField('Province', const Icon(Icons.landscape)),
                  createTextFormField('City', const Icon(Icons.location_city)),
                  createTextFormField('Postal Code', const Icon(Icons.house)),
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

                            showSnackBar(context, 'Info. Saved!');
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

  Widget createTextFormField(String field, Icon icon) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        //Name Validator
        decoration: InputDecoration(
          prefixIcon: icon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: field,
        ),
        onSaved: (value) {
          switch (field) {
            case 'Name':
              {
                _name = value;
              }
              break;
            case 'Country':
              {
                _country = value;
              }
              break;
            case 'Province':
              {
                _province = value;
              }
              break;
            case 'City':
              {
                _city = value;
              }
              break;
            default:
              {
                _postal = value;
              }
              break;
          }
        },
        validator: (value) {
          return field != 'Postal Code'
              ? RegexValidation().validateNoNums(field.toLowerCase(), value)
              : RegexValidation().validatePostal(value);
        },
      ),
    );
  }
}
