import 'package:flutter/material.dart';

class Dialog {
  static void alert(BuildContext context,
      {String title = '', String message = ''}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
            content: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
            backgroundColor: Color(0xffDAA520),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  "Cerrar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed',
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
