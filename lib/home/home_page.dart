import 'package:flutter/material.dart';
import 'package:notes/home/components/btn_add_widget.dart';
import 'package:notes/home/components/note_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>["Primeiro item"];

  void editNote(i) async {
    var response =
        await Navigator.pushNamed(context, "/create-note", arguments: notes[i]);
    if (response != null) {
      var description = response as String;
      if (response.isEmpty) {
        notes.removeAt(i);
      } else {
        notes[i] = description;
      }
    }
    setState(() {});
  }

  void addNote() async {
    var description = await Navigator.pushNamed(context, "/create-note");
    if (description != null) {
      notes.add(description as String);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              NoteWidget(note: notes[i], index: i, editNote: editNote)
          ],
        ),
      ),
      floatingActionButton: BtnAddWidget(addNote: addNote),
    );
  }
}
