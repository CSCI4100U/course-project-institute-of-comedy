import 'package:flutter/material.dart';
import 'package:zamazon/widgets/createAppBar.dart';

class CustomerAddressWidget extends StatefulWidget {
  const CustomerAddressWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<CustomerAddressWidget> createState() => _CustomerAddressWidgetState();
}

class _CustomerAddressWidgetState extends State<CustomerAddressWidget> {
  final zamazonLogo = 'https://i.imgur.com/Ty5m1io.png';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  '${widget.title}',
                  style: const TextStyle(fontSize: 30),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  //Country Validator
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Country',
                    hintText: 'Country name',
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Country';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid Country';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  //Province Validator
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Province',
                    hintText: 'Province name',
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Province';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid Province';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  //City Validator
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'City',
                    hintText: 'City name',
                  ),
                  validator: (value) {
                    RegExp regExp = RegExp(r'^[a-z A-Z,.\-]+$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a City';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid City';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  //Postal Code Validator
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    labelText: 'Postal Code',
                    hintText: 'Postal Code Example: A1A 1A1 ',
                  ),
                  validator: (value) {
                    RegExp regExp =
                        RegExp(r'^[A-Z][0-9][A-Z]\s[0-9][A-Z][0-9]$');
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Postal Code';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter a valid Postal Code';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrangeAccent),
                child: TextButton(
                    //Confirmed sign up and return to home page as logged in user
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                            "Address Accepted!",
                            style: TextStyle(fontSize: 20),
                          )),
                        );
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }
                    },
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(
                          side: BorderSide(
                        width: 50,
                        color: Colors.deepPurple,
                      )),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Continue')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
