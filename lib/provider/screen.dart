import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_test/main.dart';
import 'package:smart_test/pages/p_view.dart';

class ChangeState  {

  Future<Widget> changeState()async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');

  Widget screen = (decision == true || decision == null) ? PView() : MyApp();

  return screen;
  }
}