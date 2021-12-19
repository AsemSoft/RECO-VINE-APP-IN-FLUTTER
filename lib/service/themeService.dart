import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
class ThemeService {

    final _box =GetStorage();
    final _key="isDarkMode";
    _saveThemeBox(bool isDarkMode)=>_box.write(_key, isDarkMode);

    bool _loadThemeFormBox()=>_box.read(_key)??false;
    // ?? this two question mark tell you if there is a value return True else return false .
    // value here is the private _key
    ThemeMode get theme =>_loadThemeFormBox()?ThemeMode.dark:ThemeMode.light;

    void switchTheme(){
      Get.changeThemeMode(_loadThemeFormBox()?ThemeMode.light:ThemeMode.dark);
      _saveThemeBox(!_loadThemeFormBox());

    }

  }