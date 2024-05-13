
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_final/provider/theme_provider.dart';


class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      // value: themeProvider.isDarkMode,
      // onChanged: (value) {
      //
      //   final themeProvider = Provider.of<ThemeProvider>(context,listen:false);
      //   provider.toggleTheme(value);
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        themeProvider.toggleTheme(value);

      },

    );
  }
}