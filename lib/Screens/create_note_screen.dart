import 'package:database_project/Modle/Note.dart';
import 'package:database_project/Storiage/NoteController.dart';
import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  String? title;

  CreateNoteScreen({this.title});
  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  TextEditingController? _nameEditingController;
  TextEditingController? _detailsEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _detailsEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameEditingController!.dispose();
    _detailsEditingController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _nameEditingController,
              //     keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _detailsEditingController,
              //  keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                hintText: "Details",
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await performeCreate();
                },
                icon: const Icon(Icons.save),
                label: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future performeCreate() async {
    if (checkData()) {
      await create();
    }
  }

  bool checkData() {
    if (_nameEditingController!.text.isNotEmpty &&
        _detailsEditingController!.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future create() async {
    bool? inserted = await NoteController.instance?.create(getNote());
    if (inserted!) {
      print("Inserted successfully");
    }
    clear();
  }

  Note getNote() {
    return Note(
        title: _nameEditingController?.text,
        details: _detailsEditingController?.text);
  }

  void clear() {
    _detailsEditingController?.text = "";
    _nameEditingController?.text = "";
  }
}
