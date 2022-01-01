import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/main.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/provider/add_file.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class StrartSplachScreen extends StatefulWidget {
  static String id = "StrartSplachScreen";
  const StrartSplachScreen({Key? key}) : super(key: key);

  @override
  _StrartSplachScreenState createState() => _StrartSplachScreenState();
}

class _StrartSplachScreenState extends State<StrartSplachScreen> {
  // static String id = "StrartSplachScreen";
  @override

  Widget build(BuildContext context) {
    return  SplashScreenView(
          navigateRoute: ChangeNotifierProvider<AddFile>(
              create: (context)=>AddFile(),
              child: MainPage()),
          duration:5000 ,
          imageSize: 250,
          imageSrc:"images/started page.png",
          text: "RECO VINE APP",
          textType: TextType.ColorizeAnimationText,
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.white,
     textStyle: TextStyle(color: primaryColor ,fontWeight:FontWeight.bold ,fontSize: 30),

    );
  }
}






