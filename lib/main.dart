import 'package:flutter/material.dart';
import 'package:net_app/pages/create_about.dart';
import 'package:net_app/pages/create_publication.dart';
import 'package:net_app/pages/login_page.dart';
import 'package:net_app/pages/main_page.dart';
import 'package:net_app/pages/my_profile.dart';
import 'package:net_app/pages/signin_page.dart';
import 'package:net_app/pages/splash_page.dart';
import 'package:net_app/pages/users_page.dart';
import 'package:net_app/providers/me_user.dart';
import 'package:provider/provider.dart';

import 'pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MeUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/signin': (BuildContext context) => SignInPage(),
          '/signup': (BuildContext context) => SignUpPage(),
          '/main': (BuildContext context) => MainPage(),
          '/login': (BuildContext context) => LoginPage(),
          '/splash': (BuildContext context) => SplashPage(),
          '/users': (BuildContext context) => UsersPage(),
          '/my-info': (BuildContext context) => MyProfilePage(),
          '/create-publication': (BuildContext context) => CreatePublicationPage(),
          '/create-about': (BuildContext context) => CreateAboutPage(),
        },
        home: SplashPage(),
      ),
    );
  }
}
