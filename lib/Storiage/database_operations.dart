

import '../Modle/Note.dart';

abstract class DatabaseOperations<T>{

   void create(T object);
  Future <List<Note> >read();
  void update(T object);
  void delete(int id);
}