import 'package:flutter/material.dart';

const Color primaryColor = Colors.green;
const Color darkColor = Colors.black12;
const Color secondColor =  Color(0x8499D7B4);


class Themes {
  //properties of light mode
  static final lightMode = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    primaryColorLight: primaryColor,
    colorScheme: ColorScheme.light().copyWith(primary: primaryColor,),
  );


//properties of dark mode

  static final darkMode = ThemeData(
    primaryColor: darkColor,
    brightness: Brightness.dark,
  );
}
