import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/themes.dart';

import '../widgets/changeTheme.dart';
import '../widgets/createAppBar.dart';
import '../zamazonLogo.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {

  @override
  Widget build(BuildContext context) {
    final ContainerTheme = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? Colors.grey[900]
        : Colors.white;

    return Scaffold(
      appBar: createAppBar(context, zamazonLogo),
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: ContainerTheme,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Light/Dark Theme',style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    width: 100,
                  ),
                  ChangeThemeButtonWidget(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Notification Settings',style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    width: 100,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text('Legal Stuff',style: TextStyle(fontSize: 20)),
                  const SizedBox(
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
