import 'package:flutter/material.dart';

ThemeData appliTheme = ThemeData(
  shadowColor: Colors.blue,
  brightness: Brightness.dark,
  primaryColor: Colors.blueAccent,
  scaffoldBackgroundColor: Colors.grey[900],
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
    disabledColor: Colors.grey,
  ),
  textSelectionTheme: const TextSelectionThemeData(selectionColor: Colors.blue),
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blueAccent,
    surface: Colors.blue,
    background: Colors.blue,
    error: Colors.red,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.black,
    brightness: Brightness.dark,
  ),
);
