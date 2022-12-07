import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamazon/models/themeBLoC.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeBLoC>(context);

    bool isDarkMode = themeProvider.isDarkMode;

    return Switch.adaptive(
      value: isDarkMode,
      onChanged: (value) {
        // final themeProvider = Provider.of<ThemeBLoC>(context, listen: false);

        themeProvider.toggleTheme(value);

        isDarkMode = themeProvider.isDarkMode;
      },
    );
  }
}
