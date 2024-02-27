import 'package:flutter/material.dart';

//You can define as many themes as you want, here I have made dark theme.

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Colors.deepPurple,
    onPrimary: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle:
          MaterialStateProperty.all(const TextStyle(color: Colors.white)),
      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),
);

