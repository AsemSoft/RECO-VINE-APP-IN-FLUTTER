import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/service/utils.dart';
import 'package:smart_test/widgets/drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(MainPage());
            },
            icon: Icon(Icons.home),
          ),
        ],
        title: Text("About Us"),
      ),
        drawer: Drawer(
          child: MainDrawer(),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Center(
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: AssetImage("images/about-us.png"),
                  backgroundColor: Get.isDarkMode?  primaryColor: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "About US",
              style: TextStyle(
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(30),
              child: const Text(
                "The department of Data Science and Engineering at "
                "the Faculty of Informatics of ELTE is conducting a project aimed at recognizing"
                "the types of the vine based on the image of its leaves."
                "The underlying machine learning methods are developed by José Luis"
                "Seixas Junior a Phd student at the department"
                "\n \n The goal of the thesis is to develop a mobile application supporting "
                "the given project in which a person makes a photo and receives the "
                "recommendation  ranking for the type of the related vine."
                "\n \n The application should be user friendly, working in both on-line and"
                "off-line mode and its requirements for the technical infrastructure"
                "(i.e. the performance of a mobile device) should be as low as possible"
                "in order to be used on various devices and platforms.",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    height: 1.4),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.github,
                  ),
                  iconSize: 100,
                  color: Colors.green,
                  splashColor: Colors.green,
                  onPressed: () =>
                      Utils.openLink(url: 'https://github.com/Evil4eveR/RicoVineApp'),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text("RicoVine" ,style: TextStyle(color: primaryColor ,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Version 1.0",style: TextStyle(color: primaryColor ,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("All Rights Reserved",style: TextStyle(color: primaryColor ,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
