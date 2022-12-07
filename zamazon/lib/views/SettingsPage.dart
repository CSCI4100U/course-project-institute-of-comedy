import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';

import 'package:zamazon/models/themeBLoC.dart';
import 'package:zamazon/widgets/genericSnackBar.dart';
import '../widgets/changeThemeButton.dart';
import 'package:zamazon/authentication/authFunctions.dart';

import 'package:zamazon/models/db_utils.dart';
import 'package:zamazon/themes.dart';
import 'package:zamazon/controllers/enterAddress.dart';
import 'package:zamazon/views/orderHistory.dart';
import 'package:zamazon/views/orderTrackMap.dart';

import '../models/CusUser.dart';
import '../models/userModel.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  final languages = ['en', 'fr', 'sp', 'cn', 'jp'];
  String? value;
  final _auth = Auth();

  // needed in changeThemeButton.dart to fix a problem
  void refreshFromChild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final containerTheme =
        Provider.of<ThemeBLoC>(context).themeMode == ThemeMode.dark
            ? Colors.grey[900]
            : Colors.white;

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        // margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: containerTheme,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(FlutterI18n.translate(context, "SettingPage.theme"),
                      style: TextStyle(fontSize: 20),
                      softWrap: true,
                      maxLines: 2),
                  ChangeThemeButtonWidget(
                    refreshParent: refreshFromChild,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                  FlutterI18n.translate(context, "SettingPage.notification"),
                  style: TextStyle(fontSize: 20),
                  softWrap: true,
                  maxLines: 2),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                  FlutterI18n.translate(context, "SettingPage.legality"),
                  style: TextStyle(fontSize: 20),
                  softWrap: true,
                  maxLines: 2),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      FlutterI18n.translate(
                        context,
                        "SettingPage.language",
                      ),
                      style: TextStyle(fontSize: 20),
                      softWrap: true,
                      maxLines: 2),
                  DropdownButton<String>(
                      value: value,
                      iconSize: 30,
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                      items: languages.map(buildMenuLang).toList(),
                      onChanged: (value) async {
                        this.value = value;
                        Locale newLocale = Locale(value!);
                        await FlutterI18n.refresh(context, newLocale);
                        setState(() {});
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Order History", style: TextStyle(fontSize: 20)),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const OrderHistory()));
                          },
                          icon: const Icon(Icons.arrow_forward)),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  showSnackBar(context,
                      FlutterI18n.translate(context, "SettingPage.logout"));
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.orange),
              ))),
              child: const Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuLang(String lang) => DropdownMenuItem(
        value: lang,
        child: Text(
          lang,
          style: const TextStyle(fontSize: 20),
        ),
      );
}
