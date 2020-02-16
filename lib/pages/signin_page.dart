import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:net_app/api/api.dart';
import 'package:net_app/widgets/input_text.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _logInKey = GlobalKey<FormState>();
  final _api = Api();
  var _username = '', _password = '';
  var _isFetching = false;

  @override
  void initState() {
    super.initState();
  }

  _submit() async {
    if (_isFetching) return;

    final isValid = _logInKey.currentState.validate();
    if (isValid) {
      setState(() {
        _isFetching = true;
      });
      final isOk =
          await _api.logIn(context, username: _username, password: _password);

      setState(() {
        _isFetching = false;
      });

      if (isOk) {
        print("logged");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, left: 20.0),
                    child: Text(
                      'Login.',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'RobotoCondensed',
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: 67,
                            height: 67,
                            decoration: BoxDecoration(
                              color: Color(0xffDAA520),
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'images/NET_LOGO.png',
                              width: 35,
                              height: 35,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Form(
                    key: _logInKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 35.0,
                        ),
                        InputText(
                          label: 'Usuario',
                          isSecure: false,
                          validator: (String text) {
                            _username = text;
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        InputText(
                          label: 'Contraseña',
                          isSecure: true,
                          validator: (String text) {
                            _password = text;
                          },
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                          ),
                          child: Container(
                            width: size.width,
                            height: 60,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Color(0xffDAA520),
                              onPressed: () => _submit(),
                              child: Text(
                                'Acceder.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'RobotoCondensed',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            bottom: 20.0,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Olvidaste tu contraseña?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoCondensed',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _isFetching
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.red,
                            
                          ),
                        )
                      : Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
