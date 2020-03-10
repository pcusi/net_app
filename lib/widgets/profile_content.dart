import 'package:flutter/material.dart';
import 'package:net_app/pages/main_page.dart';

class ProfileContent extends StatefulWidget {
  ProfileContent({Key key}) : super(key: key);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
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
              child: GestureDetector(
                child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 25,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
