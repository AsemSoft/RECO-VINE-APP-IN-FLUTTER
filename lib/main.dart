import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/pages/p_view.dart';
import 'package:smart_test/pages/start_splachScreen.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:get/get.dart';
import 'UI/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/size_config.dart';
import 'provider/add_file.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');
  Widget _screen =
  ( decision == false || decision == null) ?  PageVIew() :   MyApp();


  // runApp(MyApp());
  runApp(ChangeNotifierProvider<AddFile>(
      create: (context)=>AddFile(),
      child:  _screen));

  // runApp(DevicePreview(builder: (context) => MyApp()));
  // runApp(DevicePreview(builder: (context) => _screen));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // builder: DevicePreview.appBuilder,
      title: 'RECON VINE',
      theme: Themes.lightMode,
      darkTheme: Themes.darkMode,
      themeMode: ThemeService().theme,
      // home: ViewPage(),
      home: StrartSplachScreen(),
    );


  }
}
