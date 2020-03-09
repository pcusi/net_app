import 'package:flutter/material.dart';

class DividerCard extends StatefulWidget {
  final double width;

  DividerCard({Key key, this.width}) : super(key: key);

  @override
  _DividerCardState createState() => _DividerCardState();
}

class _DividerCardState extends State<DividerCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffDAA520), width: 3.0),
          ),
        ),
      ),
    );
  }
}
