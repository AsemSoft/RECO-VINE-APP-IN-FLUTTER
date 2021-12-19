import 'package:flutter/material.dart';

const Color primaryColor = Colors.green;
const Color darkColor = Colors.black12;

class Themes {
  //properties of light mode
  static final lightMode = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    primarySwatch: Colors.green,
  );

//properties of dark mode

  static final darkMode = ThemeData(
    primaryColor: darkColor,
    brightness: Brightness.dark,
  );
}
