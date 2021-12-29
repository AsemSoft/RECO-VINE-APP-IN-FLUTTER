import 'dart:async';
import 'package:path/path.dart';
import 'package:smart_test/service/image_file.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseFile{
  List <ImagesFile> _list =[];
  int s=0;
  static Database? _database;
  static String dbName ='uu.db';
  static const String imageTable='imageTable';
  static const String id ='id';
  static const String name ='name';
  static const String date ='date';
  static const String details ='details';
  static const String image1 ='image1';
  static const String image2 ='image2';
  static const String image3 ='image3';
  static const String image4 ='image4';
  static const String image5 ='image5';
  static const String result1 ='result1';
  static const String result2 ='result2';
  static const String result3 ='result3';
  static const String result4 ='result4';
  static const String result5 ='result5';


  Future <Database> get database async{
    if (_database != null) return _database!;

    _database=await _initDB(dbName);
    return _database!;
  }
  Future <Database>_initDB(String filePath)async{
    final dbPath= await getDatabasesPath();
    final path = join(dbPath,filePath);
    var db=await openDatabase(path,version: 1,onCreate: _createDB);
    return db;
  }
  Future _createDB(Database db, int version)async {
    await db.execute('CREATE TABLE $imageTable ('
        '$id INTEGER, $name TEXT, $details TEXT, $date TEXT,'
        '$image1 TEXT, $image2 TEXT, $image3 TEXT, $image4 TEXT, $image5 TEXT,'
        '$result1 TEXT, $result2 TEXT, $result3 TEXT, $result4 TEXT, $result5 TEXT )');
  }

  int getID(){
    getAllImagesFile().then((value){
      if(value.isNotEmpty){
        _list.addAll(value);}
    });
    if (_list.isEmpty){
      return 0;
    }else{
      return _list.last.id!+1;
    }
  }
  Future <ImagesFile>save(ImagesFile imagesFile)async{
    final db = await database;
    imagesFile.id = await db.insert(imageTable,imagesFile.toMap());
    return imagesFile;
  }

  Future<List<ImagesFile>> getAllImagesFile()async {
    var db = await database;
    var orderBy = '$date ';
    // final maps=await db.rawQuery('SELECT * FROM $imageTable ORDER BY $orderBy');
    final maps=await db.query( imageTable, orderBy: orderBy);
    List <ImagesFile> imageFiles=[];
    if(maps.isNotEmpty){
      for( int i=0; i<maps.length;i++) {
        imageFiles.add(ImagesFile.fromMap(maps[i]));
      }
    }

    // return result.map((e) => ImagesFile.fromMap(e)).toList();
    return imageFiles;


  }

  Future <int> update(ImagesFile imagesFile)async{
    final db = await database;
    return db.update(
      imageTable,
      imagesFile.toMap(),
      where: '$id = ?',
      whereArgs: [imagesFile.id],
    );
  }

  Future <int> delete(int _id)async{
    final db = await database;
    return db.delete(
      imageTable,
      where: '$id = ?',
      whereArgs: [_id],
    );
  }

  Future close()async{
    final db =await database;
    db.close();
  }
}