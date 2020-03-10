import 'package:flutter/material.dart';
import 'package:net_app/providers/me_user.dart';
import 'package:net_app/widgets/profile_content.dart';
import 'package:net_app/widgets/text.dart';

class MyProfilePage extends StatefulWidget {
  MyProfilePage({Key key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  MeUser _me;

  @override
  Widget build(BuildContext context) {
    _me = MeUser.of(context);

    final size = MediaQuery.of(context).size;

    return Material(
      child: Container(
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
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ProfileContent(),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    "${_me.data.names + " " + _me.data.surnames}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoCondensed',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                //description or biography of the user
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextCustomize(
                      text: 'NETWORK SECURITY ANALIST',
                      colors: Color(0xffffffff),
                      fontFamily: 'RobotoCondensed',
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                //details of the user (friends, publications, comments)
                Container(
                  width: size.width * .8,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffDAA520),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(offset: Offset(0, 1), color: Colors.black12)
                    ],
                  ),
                  //print details
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextCustomize(
                        text: 'Amigos',
                        colors: Color(0xffffffff),
                        fontFamily: 'RobotoCondensed',
                        fontSize: 14,
                      ),
                      TextCustomize(
                        text: 'Publicaciones',
                        colors: Color(0xffffffff),
                        fontFamily: 'RobotoCondensed',
                        fontSize: 14,
                      ),
                      TextCustomize(
                        text: 'Comentarios',
                        colors: Color(0xffffffff),
                        fontFamily: 'RobotoCondensed',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.0,
                ),
                //about the user
                Container(
                  width: double.infinity,
                  height: size.height - 330,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(75.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 38.0, top: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextCustomize(
                        text: 'Sobre mí',
                        colors: Color(0xff000000),
                        fontFamily: 'RobotoCondensed',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 25,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: 94,
                  height: 94,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
