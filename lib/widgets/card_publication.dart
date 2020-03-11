import 'package:flutter/material.dart';
import 'package:net_app/widgets/divider_card.dart';

class CardPublication extends StatefulWidget {
  final double width;
  final double height;
  final Text text;
  final String subtext;
  final String description;
  final String image;
  final double radius;

  const CardPublication({
    Key key,
    this.width,
    this.height,
    this.text,
    this.subtext,
    this.description,
    this.image,
    this.radius,
  }) : super(key: key);

  @override
  _CardPublicationState createState() => _CardPublicationState();
}

class _CardPublicationState extends State<CardPublication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
          )
        ],
      ),
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
                    child: CircleAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        widget.text,
                        Text(
                          widget.subtext,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
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
                      Container(
                        width: 300,
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontFamily: 'RobotoCondensed',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      DividerCard(width: 300),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: GestureDetector(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.message,
                                size: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Comentar publicación',
                                  style: TextStyle(
                                    fontFamily: 'RobotoCondensed',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
