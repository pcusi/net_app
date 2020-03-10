import 'package:flutter/material.dart';

class TextArea extends StatefulWidget {
  final String hint;
  final Function(String) validator;
  final bool isSecure;
  final TextInputType type;
  final Color color;

  const TextArea(
      {Key key, this.color, this.hint, this.validator, this.isSecure, this.type})
      : super(key: key);

  @override
  _TextAreaState createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
  final style = TextStyle(
    color: Colors.black,
    fontFamily: 'RobotoCondensed',
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: 8,
        keyboardType: widget.type,
        obscureText: widget.isSecure,
        validator: widget.validator,
        style: style,
        decoration: InputDecoration.collapsed(
          hintText: widget.hint
        ),
      ),
    );
  }
}
