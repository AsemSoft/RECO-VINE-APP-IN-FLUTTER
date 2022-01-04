import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/pages/main_page.dart';
import 'package:smart_test/pages/search.dart';

import 'package:smart_test/provider/add_file.dart';
import 'package:smart_test/service/file_db.dart';
import 'package:smart_test/service/image_file.dart';
import 'package:smart_test/ulity.dart';
import 'package:smart_test/widgets/drawer.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);
  static List<String> results = [];

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  File? img;
  final Color _colors = const Color(0x99499973);
  final Color _colors3 = const Color(0x59011509);
  final Color _colors4 = const Color(0x593E6D2F);
  final Color _colors5 = const Color(0x5967AF34);
  bool isLoading = false;
  double progress = 0.0;
  final Dio dio = Dio();
  late DatabaseFile db ;
  List <ImagesFile> imagesFile=[];
  List <int> list =[];

  refresh() {
    db.getAllImagesFile().then((value) {
      imagesFile.clear();
      imagesFile.addAll(value);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db=DatabaseFile();
    imagesFile=[];
    //
    db.getAllImagesFile().then((value)async{
      if(value.isNotEmpty){
        setState(() {
          imagesFile.addAll(value);
        });
        if (imagesFile.isNotEmpty){
          for(int i=0;i<imagesFile.length;i++)
          {
            list.add(imagesFile.elementAt(i).id!);
          }
        }
      }
    });



  }
  int getID(){

    if (list.isEmpty){
      return 0;
    }else{
      return list.last+1;

    }
  }

  @override
  Widget build(BuildContext context) {
    List<File> imageFile = Provider.of<AddFile>(context).imageFile;

    return  Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ));
              },
              icon: Icon(Icons.home),
            ),
          ],
          title: Text("Result"),
          backgroundColor: Get.isDarkMode ? darkColor : primaryColor,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width * .8,
                  alignment: Alignment.center,
                  child: const Text(
                    'THE RESULT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: primaryColor,
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: MediaQuery.of(context).size.height * .53,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 55,
                                        width: 55,
                                        child: imageFile.isEmpty
                                            ? Container()
                                            : Image.file(
                                          imageFile.elementAt(0),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    imageFile.isEmpty
                                        ? Container()
                                        : Container(
                                      decoration: BoxDecoration(
                                          color: _colors3,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 50,
                                      child: const Text(
                                        '85%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 55,
                                        width: 55,
                                        child: imageFile.length >= 2
                                            ? Image.file(
                                          imageFile.elementAt(1),
                                          fit: BoxFit.cover,
                                        )
                                            : Container(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    imageFile.length >= 2
                                        ? Container(
                                      decoration: BoxDecoration(
                                          color: _colors3,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 50,
                                      child: const Text(
                                        '87%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 55,
                                        width: 55,
                                        child: imageFile.length >= 3
                                            ? Image.file(
                                          imageFile.elementAt(2),
                                          fit: BoxFit.cover,
                                        )
                                            : Container(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    imageFile.length >= 3
                                        ? Container(
                                      decoration: BoxDecoration(
                                          color: _colors,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 50,
                                      child: const Text(
                                        '75%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(0),
                                        height: 55,
                                        width: 55,
                                        child: imageFile.length >= 4
                                            ? Image.file(
                                          imageFile.elementAt(3),
                                          fit: BoxFit.cover,
                                        )
                                            : Container(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    imageFile.length >= 4
                                        ? Container(
                                      decoration: BoxDecoration(
                                          color: _colors4,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 50,
                                      child: const Text(
                                        '45%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        height: 55,
                                        width: 55,
                                        child: imageFile.length >= 5
                                            ? Image.file(
                                          imageFile.elementAt(4),
                                          fit: BoxFit.cover,
                                        )
                                            : Container(),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    imageFile.length >= 4
                                        ? Container(
                                      decoration: BoxDecoration(
                                          color: _colors5,
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 50,
                                      child: const Text(
                                        '35%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: secondColor,
                                  borderRadius: BorderRadius.circular(20)),
                              height: MediaQuery.of(context).size.height * .3,
                              width: MediaQuery.of(context).size.width * .9,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'images/2.jpg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 8,
                  ),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(children: <Widget>[
                        MaterialButton(
                          minWidth: 65,
                          height: 65,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: const Icon(
                            Icons.share_sharp,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                        const Text('Share', style: TextStyle(fontSize: 18)),
                      ]),
                      Column(children: <Widget>[
                        MaterialButton(
                          minWidth: 65,
                          height: 65,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: const Icon(
                            Icons.save_outlined,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: (){
                            db.save(
                                ImagesFile(
                                    id:getID(),
                                    date: DateTime.now(),
                                    details: 'this result for flowers',
                                    image1: Utility.imageName[0],
                                    image2: Utility.imageName[1],
                                    image3: Utility.imageName[2],
                                    image4: Utility.imageName.length>3?Utility.imageName[3]:'',
                                    image5: Utility.imageName.length>4?Utility.imageName[4]:'',
                                    result1: '94%',
                                    result2: '87%',
                                    result3: '54%',
                                    result4:Utility.imageName.length>3?'45%':'',
                                    result5:Utility.imageName.length>4?'33%':'',
                                    name: 'results ${ getID()}'
                                ));
                            //Navigator.of(context).pop;
                            print(Utility.name+ '${getID()}');

                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SearchPage(),));
                            Utility.imageName.clear();
                          },
                        ),
                        const Text('Save', style: TextStyle(fontSize: 18)),
                      ]),
                      Column(children: <Widget>[
                        MaterialButton(
                          minWidth: 65,
                          height: 65,
                          color: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35)),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 35,
                          ),
                          onPressed: () async {
                            AddFile imageFile1 =
                                Provider.of<AddFile>(context, listen: false);
                            await imageFile1.deleteImage(imageFile);
                          },
                        ),
                        const Text('Delete', style: TextStyle(fontSize: 18)),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
