import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/pages/p_view.dart';
import 'package:smart_test/pages/result_page.dart';
import 'package:smart_test/pages/search.dart';
import 'package:smart_test/pages/start_splachScreen.dart';
import 'package:smart_test/provider/screen.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:get/get.dart';
import 'package:smart_test/test.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'UI/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/add_file.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  SharedPreferences pref = await SharedPreferences.getInstance();
  bool? decision = pref.getBool('x');

  Widget screen = (decision == true || decision == null) ? PView() : MyApp();

  runApp(screen);
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddFile>(
          create: (_) => AddFile(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RECO VINE',
        theme: Themes.lightMode,
        darkTheme: Themes.darkMode,
        themeMode: ThemeService().theme,
        home:MainPage(),
      ),
    );
  }
}
