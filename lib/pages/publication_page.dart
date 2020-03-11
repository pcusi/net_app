import 'package:flutter/material.dart';
import 'package:net_app/api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:net_app/models/publication.dart';
import 'package:net_app/widgets/card_publication.dart';

class PublicationPage extends StatefulWidget {
  PublicationPage({Key key}) : super(key: key);

  @override
  _PublicationPageState createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  Api api = new Api();

  Future<List<Publication>> getPublications() async {
    final token = await api.getAccessToken();

    if (token != null) {
      final result = await api.getPublications(context, token);

      return result;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    getPublications();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: FutureBuilder<List<Publication>>(
          future: getPublications(),
          builder: (content, snapshot) {
            if (snapshot.hasData) {
              return Wrap(
                children: <Widget>[
                  Container(
                    width: size.width * .8,
                    height: 356,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: CardPublication(
                            width: size.width * .8,
                            height: size.height / 4.7,
                            radius: 15.0,
                            text: Text(
                                '${snapshot.data[index].user.names} ${snapshot.data[index].user.surnames}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'RobotoCondensed')),
                            subtext: snapshot.data[index].createdAt.toString(),
                            description: snapshot.data[index].description,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return CupertinoActivityIndicator(
                radius: 15,
              );
            }
          },
        ),
      ),
    );
  }
}
