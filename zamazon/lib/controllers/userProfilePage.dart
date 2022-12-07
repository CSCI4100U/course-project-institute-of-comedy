import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:zamazon/models/CusUser.dart';
import 'package:zamazon/models/userModel.dart';
import 'package:zamazon/authentication/regexValidation.dart';
import 'package:zamazon/authentication/authFunctions.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key, this.title});

  final String? title;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _auth = Auth();

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
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: const [
                      0.5,
                      0.7,
                      0.9,
                      // 0.8,
                      1.0,
                    ],
                    colors: [
                      Colors.orange.shade100,
                      Colors.orange.shade300,
                      Colors.orange.shade500,
                      // Colors.orange.shade600,
                      Colors.orange,
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  // height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: (snapshot.data.name != 'Default')
                      ? Column(
                          children: [
                            const Text('Ability to change these - WIP'),
                            createTextFormField(FlutterI18n.translate(context, "UserProfilePage.name"), snapshot.data.name,
                                const Icon(Icons.person)),

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        50)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    _auth.addUserInfo(_name!, _country!,
                                        _province!, _city!, _postal!);
                                  }
                                },
                                child: Text(FlutterI18n.translate(context, "UserProfilePage.save")))
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Four of the text field are identical apart from the label
  // so I use this to generate them.
  Widget createTextFormField(String field, String original, Icon icon) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextFormField(
        initialValue: original,
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
