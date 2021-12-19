import 'package:flutter/material.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/widgets/drawer.dart';
import 'package:get/get.dart';
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor:Get.isDarkMode ?darkColor:primaryColor ,
        title: Text('Smart Test'),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),

      body: Center(),

    );
  }
}
