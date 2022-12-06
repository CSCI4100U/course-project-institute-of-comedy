import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/themes.dart';
import 'package:getwidget/getwidget.dart';
import '../widgets/changeTheme.dart';
import '../zamazonLogo.dart';

class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  final languages = ['en', 'fr', 'sp'];
  String? value;

  @override
  Widget build(BuildContext context) {
    final ContainerTheme =
        Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
            ? Colors.grey[900]
            : Colors.white;

    return SingleChildScrollView(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(FlutterI18n.translate(context, "setting.theme"),
                          style: TextStyle(fontSize: 20),
                          softWrap: true,
                          maxLines: 2)
                    ],
                  ),
                  Column(
                    children: [
                      ChangeThemeButtonWidget(),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(FlutterI18n.translate(context, "setting.notification"),
                      style: TextStyle(fontSize: 20),
                      softWrap: true,
                      maxLines: 2),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(FlutterI18n.translate(context, "setting.legality"),
                      style: TextStyle(fontSize: 20),
                      softWrap: true,
                      maxLines: 2),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                          FlutterI18n.translate(
                            context,
                            "setting.language",
                          ),
                          style: TextStyle(fontSize: 20),
                          softWrap: true,
                          maxLines: 2),
                    ],
                  ),
                  Column(
                    children: [
                      DropdownButton<String>(
                          value: value,
                          iconSize: 30,
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                          items: languages.map(buildMenuLang).toList(),
                          onChanged: (value) async {
                            this.value = value;
                            Locale newLocale = Locale(value!);
                            await FlutterI18n.refresh(context, newLocale);
                            setState(() {});
                          }),
                    ],
                  ),
                ],
              ),
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
          style: TextStyle(fontSize: 20),
        ),
      );
}
