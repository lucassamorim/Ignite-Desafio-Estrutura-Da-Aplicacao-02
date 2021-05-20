import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  final String note;
  final int index;
  final Function(int) editNote;
  const NoteWidget({
    Key? key,
    required this.note,
    required this.index,
    required this.editNote,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: Text(note),
          onTap: () {
            editNote(index);
          },
        ),
      ),
    );
  }
}
