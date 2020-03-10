import 'package:flutter/material.dart';
import 'package:net_app/api/api.dart';
import 'package:net_app/pages/main_page.dart';
import 'package:net_app/widgets/profile_content.dart';
import 'package:net_app/widgets/text.dart';
import 'package:net_app/widgets/text_area.dart';

class CreatePublicationPage extends StatefulWidget {
  CreatePublicationPage({Key key}) : super(key: key);

  @override
  _CreatePublicationPageState createState() => _CreatePublicationPageState();
}

class _CreatePublicationPageState extends State<CreatePublicationPage> {
  final _formKey = GlobalKey<FormState>();
  final Api api = new Api();
  var _description = '';

  submit() async {
    final token = await api.getAccessToken();

    final _isValid = _formKey.currentState.validate();

    if (_isValid) {
      if (token != null) {
        final submited = await api.createPublication(
          context,
          token,
          description: _description,
        );

        if (submited) {
          await api.getPublications(context, token);
          Navigator.pushNamed(context, '/main');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Column(
          children: <Widget>[
            ProfileContent(
              route: MainPage(),
              rowTwo: TextCustomize(
                text: 'Crear publicación',
                colors: Color(0xffffffff),
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              rowThree: GestureDetector(
                onTap: () => submit(),
                child: TextCustomize(
                  text: 'Publicar',
                  colors: Color(0xffffffff),
                ),
              ),
            ),
            SizedBox(
              height: 55.0,
            ),
            Container(
              width: double.infinity,
              height: size.height - 138,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(offset: Offset(0, 1), color: Colors.black12)
                ],
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: TextArea(
                      isSecure: false,
                      hint: '¿Que estás pensando?',
                      validator: (String text) {
                        _description = text;
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
