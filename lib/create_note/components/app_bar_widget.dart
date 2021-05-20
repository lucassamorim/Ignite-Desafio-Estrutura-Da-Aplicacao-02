import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final bool isEdit;

  const AppBarWidget({Key? key, this.isEdit = false}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  final double _prefferedHeight = 55.0;

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.isEdit ? 'Edit Note' : 'Create Note'),
      centerTitle: true,
      actions: [
        if (widget.isEdit)
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.pop(context, '');
            },
          ),
      ],
    );
  }
}
