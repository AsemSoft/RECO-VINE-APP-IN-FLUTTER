import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/pages/p_view.dart';
import 'package:smart_test/pages/result_page.dart';
import 'package:smart_test/pages/start_splachScreen.dart';
import 'package:smart_test/service/size_config.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'UI/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'pages/view.dart';
import 'provider/add_file.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');
  Widget _screen =
      (decision == false || decision == null) ?  PView() :  MyApp();

  runApp(_screen);
  // runApp(DevicePreview(builder: (context) => MyApp()));
  // runApp(DevicePreview(builder: (context) => _screen));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return ChangeNotifierProvider<AddFile>(
      create: (context) => AddFile(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        title: 'RECON VINE',
        theme: Themes.lightMode,
        darkTheme: Themes.darkMode,
        themeMode: ThemeService().theme,
        home:const StrartSplachScreen(),
      ),
    );


  }
}
