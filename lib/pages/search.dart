import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/UI/theme.dart';
import 'package:smart_test/pages/view.dart';
import 'package:smart_test/service/file_db.dart';
import 'package:smart_test/service/image_file.dart';
import 'package:smart_test/widgets/drawer.dart';

import '../core/utils/size_config.dart';
import 'main_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController textEditingController=TextEditingController();
  late DatabaseFile db;
  List<ImagesFile>  imagesFile =[];
  final Color primaryColor =  const Color(0x98009995);
  List<String> folderListTemp=[];
  List<String> folderList=[];
  List<DateTime> date=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db=DatabaseFile();

    db.getAllImagesFile().then((value)async{
      setState(() {
        imagesFile.addAll(value);
      });
      if (imagesFile.isNotEmpty){
        for(int i=0;i<imagesFile.length;i++)
        {
          folderList.add(imagesFile.elementAt(i).name!);
          date.add(imagesFile.elementAt(i).date!);
        }
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    // List<ImagesFile> imgFile = Provider.of<AddFile>(context).imagesFile ;
    return Scaffold(

      appBar:AppBar(
        title:Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(20),
          ),
          child: TextField(

            onChanged: (value){
              setState(() {
                folderListTemp=folderList.where((element) => element.toLowerCase().contains(value)).toList();
              });
            },
            controller: textEditingController,
            decoration:const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(15),
              hintText: 'Search',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ));*/
              Get.offAll(MainPage());
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),

      body:textEditingController.text.isNotEmpty&&folderListTemp.isEmpty||folderList.isEmpty?
      Center(child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget> [
          IconButton(
              icon:const Icon( Icons.search_off),
              iconSize: 100
              ,color:primaryColor,
              onPressed:( ){
                Navigator.push(context, MaterialPageRoute( builder: (context) => const MainPage(),
                ));
              }),
          const SizedBox(height: 10,),
          const Text('No Folder',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          const SizedBox(height: 10,),
          const Text('Click on icon to do a test ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),


        ],
      ),):
      ListView.builder(
          itemCount:textEditingController.text.isNotEmpty?folderListTemp.length: folderList.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: SizeConfig.screenWidth! *.9 ,
                height: SizeConfig.screenHeight! *.12,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius:25,
                        backgroundColor: primaryColor,
                        child:const Icon(Icons.folder_rounded,size:30,color:Colors.white,),
                      ),
                    ),
                    // const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          // textEditingController.text.isNotEmpty?folderListTemp[index]:
                            folderList[index],
                            style:const TextStyle(fontSize:15,fontWeight:FontWeight.bold )),
                        Text(
                          // textEditingController.text.isNotEmpty?folderListTemp[index]:
                          '${date[index]}',
                          style:TextStyle(fontSize:11,fontWeight:FontWeight.bold ) ,
                        )],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        minWidth: SizeConfig.screenWidth! *.1,
                        color: primaryColor,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            )),

                        onPressed:(){
                          Navigator.of(context).pop;
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context,) => const View(),settings:RouteSettings(arguments:imagesFile[index])));
                        },
                        child: const Text('Check',style: TextStyle(color: Colors.white),),
                      ),
                    ),

                  ],),
              ),

            );
          }),
    );
  }

}



