import 'package:flutter/material.dart';
import 'package:notes/create_note/components/app_bar_widget.dart';
import 'package:notes/create_note/components/text_widget.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  void stateTextDescription(value) {
    description = value;
    print(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(isEdit: isEdit),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: TextWidget(
            textController: textController,
            description: description,
            stateTextDescription: stateTextDescription),
      ),
    );
  }
}
