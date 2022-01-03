import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/pages/p_view.dart';
import 'package:smart_test/pages/start_splachScreen.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'UI/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/view.dart';
import 'provider/add_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');
  Widget screen;
  screen =
      (decision == true || decision == null) ? const PView() : const MyApp();

/*  runApp(ChangeNotifierProvider<AddFile>(
      create: (_)=>AddFile(),
      child: screen));*/

  runApp(DevicePreview(builder: (context) => screen));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddFile>(
      create: (context) => AddFile(),
      child: GetMaterialApp(
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'RECON VINE',
        theme: Themes.lightMode,
        darkTheme: Themes.darkMode,
        themeMode: ThemeService().theme,
        initialRoute: 'StrartSplachScreen',
        routes: {
          'StrartSplachScreen': (context) => const StrartSplachScreen(),
          'MainPage': (context) => const MainPage(),
        },
      ),
    );
  }
}
