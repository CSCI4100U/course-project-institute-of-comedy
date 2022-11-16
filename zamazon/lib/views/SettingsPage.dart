import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/db_utils.dart';
import 'package:zamazon/themes.dart';

import '../widgets/changeTheme.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  @override
  Widget build(BuildContext context) {
    final containerTheme =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey[900]
            : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: containerTheme,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Text('Light/Dark Theme',
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: 80,
                  ),
                  ChangeThemeButtonWidget(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Text('Notification Settings',
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: const [
                  Text('Legal Stuff', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
