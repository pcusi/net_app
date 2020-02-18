import 'package:flutter/material.dart';
import 'package:net_app/api/session.dart';
import '../providers/me_user.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MeUser _me;

  _leaveAcc() async {
    Session s = Session();
    await s.clear();
  }

  @override
  Widget build(BuildContext context) {
    _me = MeUser.of(context);

    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
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
                  Container(
                    width: size.width,
                    height: 83,
                    decoration: BoxDecoration(
                      color: Color(0xffDAA520),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(75),
                        bottomRight: Radius.circular(75),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: GestureDetector(
                            onTap: () {
                              print('funcionando');
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 32.0),
                          child: GestureDetector(
                            onTap: () {
                              _leaveAcc();
                              Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                            },
                            child: Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      "${_me.data.names + " " + _me.data.surnames}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),
                  Container(
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
                  )
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
          )),
    );
  }
}
