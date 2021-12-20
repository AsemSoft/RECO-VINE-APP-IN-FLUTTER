import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_test/pages/home_page.dart';
import 'package:smart_test/pages/p_view.dart';
import 'package:smart_test/pages/search.dart';
import 'package:smart_test/pages/start_splachScreen.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:get/get.dart';
import 'UI/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');

  Widget _screen =(decision == false || decision == null)?const PView():const PView();

  runApp(PView());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Smart Test',
      theme:Themes.lightMode,
      darkTheme:Themes.darkMode,
      themeMode:ThemeService().theme,

      home: const MyHomePage(),
    );
  }
}


