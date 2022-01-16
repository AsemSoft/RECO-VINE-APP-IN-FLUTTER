import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/pages/about_us.dart';
import 'package:smart_test/pages/contact_us.dart';
import 'package:smart_test/pages/search.dart';
import 'package:smart_test/service/themeService.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("images/profile.png"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Get.off(SearchPage());
            },
            title: Text("Saved File"),
            leading: Icon(Icons.save),
            iconColor: Colors.green,
          ),

          ListTile(

            onTap: () {


              setState(() {
                ThemeService().switchTheme();
                setState(() {

                });
              });
            },

            title: Get.isDarkMode ? Text("Light Mode") : Text(" Dark Mode"),
            leading:Icon( Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round),

            iconColor: Colors.green,
          ),
          ListTile(
            onTap: () {
              Get.to(AboutUs());
            },
            title: Text("About Us"),
            leading: Icon(Icons.group),
            iconColor: Colors.green,
          ),
          ListTile(
            onTap: () {
              Get.to(ContactUs());
            },
            title: Text("Contact Us"),
            leading: Icon(Icons.perm_phone_msg),
            iconColor: Colors.green,
          ),
          ListTile(
            onTap: () {
              Get.defaultDialog(
                title: "Warring",
                middleText: "Are you sure to exit from app ? ",
                backgroundColor: primaryColor,
                titleStyle: TextStyle(color: Colors.red),
                middleTextStyle: TextStyle(color: Colors.white),
                textCancel: "Cancel",
                textConfirm: "Confirm",
                onConfirm: (){
                  SystemNavigator.pop();
                },
                barrierDismissible: false,
                cancelTextColor: Colors.white,
                buttonColor: Colors.white,
                radius: 30,

              );
            },
            title: Text("Exit "),
            leading: Icon(Icons.exit_to_app),
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
