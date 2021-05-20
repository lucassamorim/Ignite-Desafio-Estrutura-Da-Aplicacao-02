import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final textController;
  final description;
  final Function(String) stateTextDescription;

  const TextWidget(
      {Key? key,
      required this.textController,
      required this.description,
      required this.stateTextDescription})
      : super(key: key);
  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: widget.textController,
          maxLines: null,
          onChanged: (value) => widget.stateTextDescription(value),
          decoration: InputDecoration(labelText: 'Descrição'),
        ),
        SizedBox(
          height: 32,
        ),
        if (widget.description.isNotEmpty)
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, widget.description);
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          )
      ],
    );
  }
}
