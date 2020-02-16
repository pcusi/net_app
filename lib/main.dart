import 'package:flutter/material.dart';
import 'package:net_app/pages/main_page.dart';
import 'package:net_app/pages/signin_page.dart';
import 'pages/login_page.dart';

import 'pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/signin': (BuildContext context) => SignInPage(),
        '/signup': (BuildContext context) => SignUpPage(),
        '/main': (BuildContext context) => MainPage(),
      },
      home: LoginPage(),
    );
  }
}

