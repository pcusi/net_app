import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_app/api/api.dart';
import 'package:net_app/models/about.dart';
import 'package:net_app/pages/main_page.dart';
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
  Api api = new Api();

  Future<About> userProfile() async {
    final token = await api.getAccessToken();

    if (token != null) {
      final result =
          await api.getUserDescription(context, token, '${_me.data.id}');

      return result;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    userProfile();
  }

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
                ProfileContent(
                  route: MainPage(),
                  rowTwo: TextCustomize(text: ' '),
                  rowThree: TextCustomize(text: ' '),
                ),
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
                FutureBuilder<About>(
                  future: userProfile(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 28.0),
                            child: TextCustomize(
                              text: snapshot.data.tagOne +
                                  " | " +
                                  snapshot.data.tagTwo,
                              colors: Color(0xffffffff),
                              fontFamily: 'RobotoCondensed',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextCustomize(
                            colors: Colors.white,
                            text: 'Crear Etiquetas',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/create-about');
                                },
                                icon: Icon(Icons.turned_in),
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
                //space again
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
                  //print details of the user
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
                //space ----
                SizedBox(
                  height: 45.0,
                ),
                //about the user, all description from the user.
                SizedBox(
                  width: double.infinity,
                  height: size.height * .47,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(75.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                          )
                        ]),
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
                          SizedBox(
                            height: 20.0,
                          ),
                          FutureBuilder<About>(
                            future: userProfile(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 35.0),
                                  child: TextCustomize(
                                    text: snapshot.data.aboutMe,
                                    colors: Color(0xff000000),
                                    fontFamily: 'RobotoCondensed',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 35.0),
                                  child: TextCustomize(
                                    text:
                                        'Por ahora no tienes ninguna descripción.',
                                    colors: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'RobotoCondensed',
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
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
