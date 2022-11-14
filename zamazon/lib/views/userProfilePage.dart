import 'package:flutter/material.dart';
import 'package:zamazon/models/CusUser.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/authentication/regexValidation.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _country;
  String? _province;
  String? _city;
  String? _postal;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //to avoid NoSuchMethodError before the stream is ready
      initialData: CusUser(),
      stream: UserModel().getUserInformation(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profile'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      stops: const [
                        0.2,
                        0.4,
                        0.6,
                        1.0,
                      ],
                      colors: [
                        Colors.orange.shade100,
                        Colors.orange.shade300,
                        Colors.orange.shade400,
                        Colors.orange.shade900,
                      ],
                    ),
                    color: Colors.orange[900],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Text(
                          snapshot.data.name[0],
                          style: const TextStyle(fontSize: 40),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        snapshot.data.name,
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(top: 16),
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: (snapshot.data.name != 'Default')
                        ? Column(
                            children: [
                              createTextFormField('Name', snapshot.data.name),
                              createTextFormField(
                                  'Country', snapshot.data.country),
                              createTextFormField(
                                  'Province', snapshot.data.province),
                              createTextFormField('City', snapshot.data.city),
                            ],
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Four of the text field are identical apart from the label
  // so I use this to generate them.
  Widget createTextFormField(String field, String original) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        initialValue: original,
        //Name Validator
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelText: field,
        ),
        onSaved: (name) {
          _name = name;
        },
        validator: (value) {
          return RegexValidation().validateNoNums(field.toLowerCase(), value);
        },
      ),
    );
  }
}
