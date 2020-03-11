import 'package:flutter/material.dart';
import 'package:net_app/api/api.dart';
import 'package:net_app/pages/my_profile.dart';
import 'package:net_app/widgets/divider_card.dart';
import 'package:net_app/widgets/profile_content.dart';
import 'package:net_app/widgets/text.dart';
import 'package:net_app/widgets/text_area.dart';

class CreateAboutPage extends StatefulWidget {
  CreateAboutPage({Key key}) : super(key: key);

  @override
  _CreateAboutPageState createState() => _CreateAboutPageState();
}

class _CreateAboutPageState extends State<CreateAboutPage> {
  final _formKey = GlobalKey<FormState>();
  final Api api = new Api();

  var _tagOne = '', _tagTwo = '', _aboutMe = '';

  submit() async {
    final isValid = _formKey.currentState.validate();

    if (isValid) {
      final token = await api.getAccessToken();
      if (token != null) {
        final response = await api.createAbout(context, token,
            tagOne: _tagOne, tagTwo: _tagTwo, aboutMe: _aboutMe);

        if (response) print(response);
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
              route: MyProfilePage(),
              rowTwo: TextCustomize(
                text: 'Editar perfil',
                colors: Color(0xffffffff),
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              rowThree: GestureDetector(
                onTap: () => submit(),
                child: TextCustomize(
                  text: 'Listo!',
                  colors: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
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
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextCustomize(
                        text: 'Etiquetas',
                        colors: Colors.black,
                        fontSize: 25.0,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 14.0),
                      TextCustomize(
                        text: 'Etiqueta 1',
                        colors: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                      TextArea(
                        lines: 1,
                        isSecure: false,
                        hint: 'Coloca una etiqueta!',
                        padding: 0.0,
                        validator: (String text) {
                          _tagOne = text;
                        },
                      ),
                      SizedBox(height: 14.0),
                      TextCustomize(
                        text: 'Etiqueta 2',
                        colors: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                      TextArea(
                        lines: 1,
                        isSecure: false,
                        hint: 'Coloca una etiqueta!',
                        padding: 0.0,
                        validator: (String text) {
                          _tagTwo = text;
                        },
                      ),
                      DividerCard(
                        width: size.width,
                      ),
                      SizedBox(height: 14.0),
                      TextCustomize(
                        text: 'Información',
                        colors: Colors.black,
                        fontSize: 25.0,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 14.0),
                      TextArea(
                        type: TextInputType.multiline,
                        lines: 3,
                        isSecure: false,
                        hint: 'Cúentale a los demás sobre ti!',
                        padding: 0.0,
                        validator: (String text) {
                          _aboutMe = text;
                        },
                      ),
                    ],
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
