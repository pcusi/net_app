import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final Function(String) validator;
  final bool isSecure;
  final TextInputType type;
  final Color color;

  const InputText(
      {Key key, this.color, this.label, this.validator, this.isSecure, this.type})
      : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final style = TextStyle(
    color: Colors.white,
    fontFamily: 'RobotoCondensed',
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: widget.type,
        obscureText: widget.isSecure,
        validator: widget.validator,
        style: style,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: widget.color,
          ),
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffDAA520),
            ),
          ),
        ),
      ),
    );
  }
}
