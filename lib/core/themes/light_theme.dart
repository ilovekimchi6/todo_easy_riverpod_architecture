import 'package:flutter/material.dart';

//You can define as many themes as you want, here I have made dark theme.

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
);
