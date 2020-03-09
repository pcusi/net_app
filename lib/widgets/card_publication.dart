import 'package:flutter/material.dart';

class CardPublication extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final String subtext;
  final String description;
  final String image;

  const CardPublication({
    Key key,
    this.width,
    this.height,
    this.text,
    this.subtext,
    this.description,
    this.image,
  }) : super(key: key);

  @override
  _CardPublicationState createState() => _CardPublicationState();
}

class _CardPublicationState extends State<CardPublication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.text),
                        Text(widget.subtext),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Color(0xffDAA520),
                        thickness: 4.0,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
