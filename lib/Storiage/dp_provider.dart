import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class db_Provider{

 db_Provider._();

 static db_Provider? _instance;
 static Database? _db;

  static Future<Database?> get instance async{
    if(_db != null)return _db;
   _instance= db_Provider._();
   _db =await _instance?.initDB();
   return _db;
  }  

  Future initDB()async{
    Directory directory = await getApplicationDocumentsDirectory();
    
    String path = join(directory.path,"app_db.sql");
    return  openDatabase( path,version: 1,
    onCreate: (Database db, int version)async{
    await  db.execute("CREATE TABLE notes("
      "id PRIMARY KEY INCREMENT,"
      "title TEXT,"
      "details TEXT"
      ")");
    },
    onOpen: (Database db){},
    onUpgrade: ( Database db, int oldVersion, int newVersion){},
    onDowngrade: ( Database db, int oldVersion, int newVersion){}
    );
  }
  

}