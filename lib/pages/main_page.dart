import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/pages/result_page.dart';
import 'package:smart_test/provider/add_file.dart';
import 'package:smart_test/service/themeService.dart';
import 'package:smart_test/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  File? img, img2, img3, img4, img5;
  final Color _colors = const Color(0x98489973);
  final picker = ImagePicker();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  List<File> imageFile = [];

  getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path != null) {
      setState(() {
        img = File(pickedFile.path);
        imageFile.add(img!);
      });
    } else {
      print('no file');
    }
  }

  getImage2(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path != null) {
      setState(() {
        img2 = File(pickedFile.path);
        imageFile.add(img2!);
      });
    } else {
      print('no file');
    }
  }

  getImage3(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path != null) {
      setState(() {
        img3 = File(pickedFile.path);
        imageFile.add(img3!);
      });
    } else {
      print('no file');
    }
  }

  getImage4(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path != null) {
      setState(() {
        img4 = File(pickedFile.path);
        imageFile.add(img4!);
      });
    } else {
      print('no file');
    }
  }

  getImage5(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    if (pickedFile!.path != null) {
      setState(() {
        img5 = File(pickedFile.path);
        imageFile.add(img5!);
      });
    } else {
      print('no file');
    }
  }

  bool disable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Main Page"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 90,
                        width: 100,
                        child: img != null
                            ? Image.file(img!)
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset('images/gallery.png',
                                    fit: BoxFit.contain)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 46),
                        child: Text(
                          'image #1',
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
                        enableFeedback: disable,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text('Add' ,style: TextStyle(color: Colors.white),),
                            Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
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
                                        getImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage(ImageSource.camera);
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 100,
                        child: img2 == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset('images/gallery.png',
                                    fit: BoxFit.fill))
                            : Image.file(img2!),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 46),
                        child: Text(
                          'image #2',
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
                            Text('Add' ,style: TextStyle(color: Colors.white),),
                            Icon(Icons.add, color: Colors.white),

                          ],
                        ),
                        onPressed: () {
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
                                        getImage2(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage2(ImageSource.camera);
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 100,
                        child: img3 == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset('images/gallery.png',
                                    fit: BoxFit.fill))
                            : Image.file(img3!),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 46),
                        child: Text(
                          'image #3',
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
                            Text('Add' ,style: TextStyle(color: Colors.white),),
                            Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
                          var ad = AlertDialog(
                            title: const Text('Choose an image'),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Divider(color: Colors.black),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: Icon(Icons.image),
                                      title: const Text('gallery'),
                                      onTap: () {
                                        getImage3(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: Icon(Icons.image),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage3(ImageSource.camera);
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 100,
                        child: img4 == null
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset('images/gallery.png',
                                  fit: BoxFit.fill),
                            )
                            : Image.file(img4!),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 46),
                        child: Text(
                          'image #4',
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
                            Text('Add' ,style: TextStyle(color: Colors.white),),
                            Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
                          var ad = AlertDialog(
                            title: const Text('Choose an image'),
                            content: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Divider(color: Colors.black),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('gallery'),
                                      onTap: () {
                                        getImage4(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: Icon(Icons.image),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage4(ImageSource.camera);
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
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 100,
                        child: img5 == null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.asset('images/gallery.png',
                                    fit: BoxFit.fill))
                            : Image.file(img5!),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20, right: 46),
                        child: Text(
                          'image #5',
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
                            Text('Add' ,style: TextStyle(color: Colors.white),),
                            Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
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
                                        getImage5(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    color: Colors.teal,
                                    child: ListTile(
                                      leading: const Icon(Icons.image),
                                      title: const Text('Camera'),
                                      onTap: () {
                                        getImage5(ImageSource.camera);
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
                height: 40,
              ),
              MaterialButton(
                  minWidth: MediaQuery.of(context).size.width * .9,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
                  height: 60,
                  color: primaryColor,
                  child: const Text('swipe right to execute the treatment' ,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white)),
                  onPressed: () async {
                    print(imageFile);
                    AddFile imageFile1 =
                        Provider.of<AddFile>(context, listen: false);
                    await imageFile1.addImage(imageFile);
                    if (imageFile1.imageFile.length >= 3) {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  ResultPage(),
                          ));
                    }
                  })
            ],
          ),
        ),

    );
  }
}
