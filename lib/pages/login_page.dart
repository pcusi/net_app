import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF232526),
              Color(0xFF414345),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 67,
              height: 67,
              decoration: BoxDecoration(
                color: Color(0xffDAA520),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'images/NET_LOGO.png',
                width: 35,
                height: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'NET.',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 75,
            ),
            Container(
              width: 285,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xffDAA520),
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text('INICIAR SESIÓN',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'o también puedes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 285,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Color(0xffDAA520),
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text('CREARME UNA CUENTA',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
