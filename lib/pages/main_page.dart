import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/core/utils/size_config.dart';
import 'package:smart_test/pages/result_page.dart';
import 'package:smart_test/provider/add_file.dart';
import 'package:smart_test/ulity.dart';
import 'package:smart_test/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  static String id = "MainPage";

  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? img1, img2, img3, img4, img5;
  final picker = ImagePicker();
  // final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  List<File> imageFile = [];


  //function git image
  getImage(ImageSource src,int i) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path !=null) {
      if (File(pickedFile.path).readAsBytesSync().length< 800000){
        if (i == 1) {
          if (!mounted) return;
          setState(() {
            img1 = File(pickedFile.path);
            print("setstate called ");
          });


        }
        else if (i == 2) {
          setState(() {
            img2 = File(pickedFile.path);
          });
          imageFile.add(img2!);
          Utility.imageName.add(Utility.base64String(img2!.readAsBytesSync()));
          print(File(pickedFile.path).readAsBytesSync().length);
          // isButtonDisable2 = true;
        }
        else if (i == 3) {
          setState(() {
            img3 = File(pickedFile.path);
          });
          imageFile.add(img3!);
          Utility.imageName.add(Utility.base64String(img3!.readAsBytesSync()));
          print(File(pickedFile.path).readAsBytesSync().length);
          // isButtonDisable3 = true;
        }
        else if (i == 4) {
          setState(() {
            img4 = File(pickedFile.path);
          });
          imageFile.add(img4!);
          Utility.imageName.add(Utility.base64String(img4!.readAsBytesSync()));
          print(File(pickedFile.path).readAsBytesSync().length);
          // isButtonDisable4 = true;
        }
        else if (i == 5) {
          setState(() {
            img5 = File(pickedFile.path);
          });
          imageFile.add(img5!);
          Utility.imageName.add(Utility.base64String(img5!.readAsBytesSync()));
          print(File(pickedFile.path).readAsBytesSync().length);
          // isButtonDisable5 = true;
        }
      }
      else {

        // print(File(pickedFile.path).readAsBytesSync().length);
        // showWarningForm(context);
        Get.defaultDialog(
          title: "Image Error",
          middleText: "Please select image size less than 2 MG",
          backgroundColor: primaryColor,
          titleStyle: TextStyle(color: Colors.red),
          middleTextStyle: TextStyle(color: Colors.white),
          textConfirm: "Confirm",
          onConfirm: (){
            Get.back();
          },
          barrierDismissible: false,
          cancelTextColor: Colors.white,
          buttonColor: Colors.white,
          radius: 30,

        );
      }
    }
    else {
      print('no file');
    }
  }


  // bool disable = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Scaffold(
          appBar: AppBar(
            title: const Text("Main Page"),
            centerTitle: true,
          ),

          drawer: Drawer(
            child: MainDrawer(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(top:SizeConfig.defaultSize! * .04),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 100,
                          child: img1 == null
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/leaf.png',
                                  fit: BoxFit.fill, color: Colors.white))
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              img1!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 46),
                          child: Text(
                            'image 1',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          color: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                          ),
                          // enableFeedback: disable,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                            // isButtonDisable1?null:
                          onPressed:(){
                            var ad = AlertDialog(
                              title: const Text('Choose an image'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('gallery'),
                                        onTap: () {
                                          getImage(ImageSource.gallery,1);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading:const Icon(Icons.image),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          getImage(ImageSource.camera,1);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => ad);

                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 100,
                          child: img2 == null
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/leaf.png',
                                  fit: BoxFit.fill, color: Colors.white))
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              img2!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 46),
                          child: Text(
                            'image 2',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          color: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                            // isButtonDisable2?null:
                          onPressed:(){
                            var ad = AlertDialog(
                              title: const Text('Choose an image'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('gallery'),
                                        onTap: () {
                                          getImage(ImageSource.gallery,2);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading:const Icon(Icons.image),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          getImage(ImageSource.camera,2);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => ad);

                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 100,
                          child: img3 == null
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/leaf.png',
                                  fit: BoxFit.fill, color: Colors.white))
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              img3!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 46),
                          child: Text(
                            'image 3',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          color: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                            // isButtonDisable3?null:
                          onPressed:(){
                            var ad = AlertDialog(
                              title: const Text('Choose an image'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('gallery'),
                                        onTap: () {
                                          getImage(ImageSource.gallery,3);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading:const Icon(Icons.image),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          getImage(ImageSource.camera,3);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => ad);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 100,
                          child: img4 == null
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/leaf.png',
                                  fit: BoxFit.fill, color: Colors.white))
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              img4!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 46),
                          child: Text(
                            'image 4',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          color: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                          // isButtonDisable4?null:()
                          onPressed:(){
                            var ad = AlertDialog(
                              title: const Text('Choose an image'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('gallery'),
                                        onTap: () {
                                          getImage(ImageSource.gallery,4);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading:const Icon(Icons.image),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          getImage(ImageSource.camera,4);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => ad);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 90,
                          width: 100,
                          child: img5 == null
                              ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/leaf.png',
                                  fit: BoxFit.fill, color: Colors.white))
                              : ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.file(
                              img5!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 46),
                          child: Text(
                            'image 5',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          minWidth: 100,
                          color: primaryColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(Icons.add, color: Colors.white),
                            ],
                          ),
                            // isButtonDisable5?null:
                          onPressed:(){
                            var ad = AlertDialog(
                              title: const Text('Choose an image'),
                              content: Container(
                                height: 150,
                                child: Column(
                                  children: [
                                    const Divider(color: Colors.black),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading: const Icon(Icons.image),
                                        title: const Text('gallery'),
                                        onTap: () {
                                          getImage(ImageSource.gallery,5);

                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      color: Colors.teal,
                                      child: ListTile(
                                        leading:const Icon(Icons.image),
                                        title: const Text('Camera'),
                                        onTap: () {
                                          getImage(ImageSource.camera,5);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                            showDialog(context: context, builder: (context) => ad);
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  MaterialButton(
                      color: primaryColor,
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width * .9,
                      padding: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      height: 60,
                      child:const Text(
                        "Swipe To Execute",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),

                      onPressed: () async {
                        print(imageFile);

                        AddFile imageFile1 = Provider.of<AddFile>(context, listen: false);
                        await imageFile1.addImage(imageFile);

                        // await  gAddFile.addImage(imageFile) ;
                        if (imageFile1.imageFile.length >= 3) {

                          // using old way by navigator;
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(),
                              ));*/
                          Get.to(ResultPage());
                        } else if (imageFile1.imageFile.length== 0) {
                          Get.defaultDialog(
                            title: "Error",
                            middleText: "No Image selected ",
                            backgroundColor: primaryColor,
                            titleStyle: TextStyle(color: Colors.red),
                            middleTextStyle: TextStyle(color: Colors.white),
                            textCancel: "Cancel",
                            cancelTextColor: Colors.white,
                            buttonColor: Colors.white,

                            radius: 30,
                          );
                        } else {
                          Get.defaultDialog(
                            title: "Error",
                            middleText: "Image selected is less than two ",
                            backgroundColor: primaryColor,
                            titleStyle: TextStyle(color: Colors.red),
                            middleTextStyle: TextStyle(color: Colors.white),
                            textCancel: "Cancel",
                            cancelTextColor: Colors.white,
                            buttonColor: Colors.white,

                            radius: 30,
                          );

                          // snakbar we can delete
                          // Get.snackbar(
                          // 'Error',
                          // 'Image Selected less than two',
                          // snackPosition: SnackPosition.BOTTOM,
                          // colorText: Colors.red,
                          // leftBarIndicatorColor: Colors.red,
                          // backgroundColor: Colors.white,
                          // icon: Icon(
                          // Icons.error,
                          // color: Colors.red,
                          // ),
                          // );
                        }
                      },
                    ),
                  ),



              ],
            ),
          ),

    );
  }


}
