import 'package:database_project/Screens/create_note_screen.dart';
import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Screen"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateNoteScreen(
                    title: "Note Note",
                  ),
                ),
              );
            },
            icon: const Icon(Icons.create),
          ),
        ],
      ),
    );
  }
}
