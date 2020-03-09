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
      child: FutureBuilder<List<Publication>>(
        future: getPublications(),
        builder: (content, snapshot) {
          if (snapshot.hasData) {
            return CardPublication(
              width: size.width * .8,
              height: 125,
              text: snapshot.data[0].user.names,
              subtext: snapshot.data[0].createdAt,
              description: snapshot.data[0].description,
            );
          } else {
            return CupertinoActivityIndicator(
              radius: 15,
            );
          }
        },
      ),
    );
  }
}
