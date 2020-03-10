import 'package:flutter/material.dart';
import 'package:net_app/api/session.dart';
import 'package:net_app/pages/my_profile.dart';

class HeaderWidget extends StatefulWidget {
  HeaderWidget({Key key}) : super(key: key);

  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: Container(
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
              child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: GestureDetector(
                onTap: () async {
                  Navigator.pop(context);

                  Session session = new Session();
                  await session.clear();

                  Navigator.pushNamed(context, '/login');
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
    );
  }
}
