import 'package:flutter/material.dart';

class ProfileContent extends StatefulWidget {
  final Widget route;
  final Widget rowTwo;
  final Widget rowThree;

  ProfileContent({Key key, this.route, this.rowTwo, this.rowThree})
      : super(key: key);

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
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => widget.route));
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                    widget.rowTwo
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[widget.rowThree],
              ),
            )
          ],
        ),
      ),
    );
  }
}
