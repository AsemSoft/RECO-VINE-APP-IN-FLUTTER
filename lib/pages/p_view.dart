import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/core/utils/size_config.dart';
import 'package:smart_test/main.dart';
import 'package:smart_test/widgets/custom_text.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  _PViewState createState() => _PViewState();
}

class _PViewState extends State<PView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewPage(),
    );
  }
}

class ViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SizeConfig().init(context);
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
                top: SizeConfig.defaultSize! * .4,
                left: SizeConfig.defaultSize! * .02,
                right: SizeConfig.defaultSize! * .02),
            width: SizeConfig.defaultSize! * 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/grapes.png",
                  width: 200,
                  height: 200,
                ),
                // Text for RECO VINE APP
                CustomeText(
                  text: 'RECO VINE APP',
                  // size: 35,

                  style: GoogleFonts.lemon(color: primaryColor, fontSize: 27),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Text Recongnizg the types
                CustomeText(
                  text: 'Recognizing the types of \n'
                      '    the vine based on the\n'
                      '       image of list leaves\n',
                  style: GoogleFonts.lato(
                    color: primaryColor,
                    fontSize: 19,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Get Started button
                MaterialButton(
                  padding: EdgeInsets.all(10),

                  minWidth: SizeConfig.defaultSize! * 1.1,
                  // height: 50,
                  color: primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));

                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool('x', true);
                  },
                  child: CustomeText(
                    text: "Get Started",
                    style: GoogleFonts.lalezar(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
