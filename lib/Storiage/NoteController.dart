
import 'package:database_project/Storiage/database_operations.dart';
import 'package:database_project/Modle/Note.dart';
import 'package:sqflite/sqflite.dart';

import 'dp_provider.dart';

class NoteController extends DatabaseOperations<Note>{
 
 db_Provider? _db_provider;
 Database? _database;

//Singlton
  NoteController._();
 static NoteController? _instance;

 static NoteController? get instance{
  if(_instance != null) return _instance;
  _instance =NoteController._();
  return _instance;
 }
//
    @override
  Future<bool> create(Note object)async {
    _database =await db_Provider.instance;
   int? insertId= await _database?.insert('notes', object.toMap(withId: false));
   return insertId !=0 ? true : false;
  }

  @override
  Future update(Note object)async {
       _database =await db_Provider.instance;
      int updateRowCount = await _database!.update('notes', object.toMap(withId: false),where: 'id = ?', whereArgs: [object.id]);
      return updateRowCount>0;
  }

  @override
  
  Future <List<Note> > read()async {
   _database =await db_Provider.instance;
   var data = await _database?.query('notes');
  List<Note>? notes = data?.map((rowMap) => Note.fromMap(rowMap)).toList();
    return notes!.isNotEmpty? notes:[];


  }

  @override
  Future<bool> delete(int id)async {
        _database =await db_Provider.instance;
          int deletedRowCount = await _database!.delete('note',where: 'id = ?',whereArgs: [id]);
           return deletedRowCount >0;
  }
 

}