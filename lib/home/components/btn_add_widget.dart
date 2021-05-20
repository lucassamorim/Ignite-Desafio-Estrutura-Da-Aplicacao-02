import 'package:flutter/material.dart';

class BtnAddWidget extends StatelessWidget {
  final Function addNote;
  const BtnAddWidget({
    Key? key,
    required this.addNote,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        addNote();
      },
    );
  }
}
