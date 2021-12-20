import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/main.dart';
import 'package:smart_test/pages/home_page.dart';
import 'package:smart_test/pages/start_splachScreen.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  // final Color _colors=const Color(0x992B4D65);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 120),
                  child: Image.asset(
                    "images/grapes.png",
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
              const Text(
                'RECO VINE APP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: primaryColor),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Recognizing the types of',
                  style: TextStyle(fontSize: 20, color: primaryColor)),
              const SizedBox(
                height: 5,
              ),
              const Text('the vine based on the',
                  style: TextStyle(fontSize: 20, color: primaryColor)),
              const SizedBox(
                height: 5,
              ),
              const Text('image of list leaves',
                  style: TextStyle(fontSize: 20, color: primaryColor)),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: RaisedButton(
                  color: primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {
                    selectScreen(context);
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('x', true);
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
void selectScreen(BuildContext ctx){
    Navigator.of(context).push(MaterialPageRoute(builder: (c){
      return MyHomePage();
    }));

}
}
