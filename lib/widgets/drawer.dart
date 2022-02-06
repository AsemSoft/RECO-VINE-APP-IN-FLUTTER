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
          const DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: null,
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
                setState(() {});
              });
            },
            title: Get.isDarkMode ? Text("Light Mode") : Text(" Dark Mode"),
            leading: Icon(Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round),
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
                onConfirm: () {
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
