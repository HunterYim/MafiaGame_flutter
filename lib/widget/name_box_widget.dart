import 'package:flutter/material.dart';

class NameBoxWidget extends StatefulWidget {
  final String name;
  final String playerNum;
  final Function(String, String) onTextChanged;

  const NameBoxWidget({
    super.key,
    required this.name,
    required this.playerNum,
    required this.onTextChanged,
  });

  @override
  State<NameBoxWidget> createState() => _NameBoxWidgetState();
}

class _NameBoxWidgetState extends State<NameBoxWidget> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: TextField(
        onChanged: (text) {
          setState(() {
            inputText = text;
          });
          widget.onTextChanged(widget.playerNum, inputText);
        },
        decoration: InputDecoration(
          labelText: '${widget.playerNum}번 플레이어',
          labelStyle: TextStyle(color: Theme.of(context).canvasColor),
          hintText: '이름을 입력하세요',
          hintStyle: TextStyle(color: Theme.of(context).canvasColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).canvasColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).canvasColor,
            ),
          ),
        ),
      ),
    );
  }
}
