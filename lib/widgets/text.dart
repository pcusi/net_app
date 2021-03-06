import 'package:flutter/material.dart';

class TextCustomize extends StatefulWidget {
  final Color colors;
  final double fontSize;
  final String fontFamily;
  final String text;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final bool wrap;
  TextCustomize({
    Key key,
    this.colors,
    this.fontSize,
    this.fontFamily,
    this.text,
    this.fontWeight,
    this.overflow,
    this.wrap
  }) : super(key: key);

  @override
  _TextCustomizeState createState() => _TextCustomizeState();
}

class _TextCustomizeState extends State<TextCustomize> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Text(
        widget.text,
        style: TextStyle(
          color: widget.colors,
          fontSize: widget.fontSize,
          fontFamily: widget.fontFamily,
          fontWeight: widget.fontWeight,
        ),
        overflow: widget.overflow,
        softWrap: widget.wrap,
      ),
    );
  }
}
