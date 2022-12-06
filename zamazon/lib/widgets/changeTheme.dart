import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:zamazon/themes.dart';

class ChangeThemeButtonWidget extends StatelessWidget{
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      value: themeProvider.isDarkMode,
      onChanged: (value){
        final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
        themeProvider.toggleTheme(value);
      },
    );
  }
}