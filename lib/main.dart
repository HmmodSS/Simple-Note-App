import 'package:database_project/Screens/create_note_screen.dart';
import 'package:database_project/Screens/note_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/note_screen',
      routes: {
        '/note_screen': (context) => NoteScreen(),
        '/create_note_screen': (context) => CreateNoteScreen(),
      },
    );
  }
}
