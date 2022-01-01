import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/widgets/drawer.dart';

import 'main_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  final Color _colors = Color(0x98009995);
  List<String> folderListTemp = [];
  List<String> folderList = [
    'salah',
    'ali',
    'ghuj',
    'olp',
    'ppp',
    'asem',
    'kslsk',
    'image',
    'image',
    'image',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));
            },
            icon: Icon(Icons.home),
          ),
        ],
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                folderListTemp = folderList
                    .where((element) => element.toLowerCase().contains(value))
                    .toList();
              });
            },
            controller: textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search',
              hintStyle:TextStyle(color: primaryColor ),


            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: textEditingController.text.isNotEmpty && folderListTemp.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.search_off),
                      iconSize: 100,
                      color: _colors,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ));
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'No Folder',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Click here to do a test ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: textEditingController.text.isNotEmpty
                  ? folderListTemp.length
                  : folderList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: _colors,
                        child: const Icon(
                          Icons.folder_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                      // const SizedBox(width: 20,),
                      Column(
                        children: [
                          Text(
                              textEditingController.text.isNotEmpty
                                  ? folderListTemp[index]
                                  : folderList[index],
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text(
                              textEditingController.text.isNotEmpty
                                  ? folderListTemp[index]
                                  : 'date of saving',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.blueGrey)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: MaterialButton(
                          minWidth: 100,
                          color: _colors,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )),
                          onPressed: () {},
                          child: const Text(
                            'Check',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
