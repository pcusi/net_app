import 'package:flutter/material.dart';
import 'package:net_app/pages/publication_page.dart';
import 'package:net_app/widgets/divider_card.dart';
import 'package:net_app/widgets/header.dart';
import '../providers/me_user.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MeUser _me;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _me = MeUser.of(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height + 150,
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
                HeaderWidget(),
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
                  height: 34,
                ),
                //input for a new publication of the user
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/create-publication');
                  },
                  child: Container(
                    width: size.width * .8,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 1,
                            offset: Offset(0.25, 4),
                            spreadRadius: 0)
                      ],
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          '¿Que publicarás hoy?',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 16.0,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'LO DE HOY',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    DividerCard(
                      width: size.width * .8,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                //print in a widget all publications of friends list from the user
                Container(
                  child: PublicationPage(),
                )
              ],
            ),
            //circle avatar customized from the user
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
