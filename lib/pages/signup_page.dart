import 'package:flutter/material.dart';
import 'package:net_app/widgets/input_text.dart';
import 'package:net_app/api/api.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _api = Api();
  var _names = '', _surnames = '', _username = '', _password = '';

  var _isFetching = false;

  @override
  void initState() {
    super.initState();
  }

  _submit() async {
    if (_isFetching) return;

    final isValid = _formKey.currentState.validate();
    if (isValid) {
      setState(() {
        _isFetching = true;
      });

      final isOk = await _api.newUser(context,
          names: _names,
          surnames: _surnames,
          username: _username,
          password: _password);

      setState(() {
        _isFetching = false;
      });

      if (isOk) {
        print("Registrado");
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
          height: size.height + 230,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 20.0),
                child: Text(
                  'Registro',
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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 35.0,
                    ),
                    InputText(
                      label: 'Nombres',
                      isSecure: false,
                      validator: (String text) {
                        _names = text;
                      },
                      color: Color(0xffffffff),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    InputText(
                      label: 'Apellidos',
                      isSecure: false,
                      validator: (String text) {
                        _surnames = text;
                      },
                      color: Color(0xffffffff),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    InputText(
                      label: 'Usuario',
                      isSecure: false,
                      validator: (String text) {
                        if (text.length < 10) {
                          _username = text;
                          return null;
                        }
                        return 'El usuario debe tener solo 10 carácteres';
                      },
                      color: Color(0xffffffff),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    InputText(
                      label: 'Contraseña',
                      isSecure: true,
                      validator: (String text) {
                        if (text.length < 8) {
                          _password = text;
                          return null;
                        }
                        return 'La contraseña solo debe tener 8 carácteres';
                      },
                      color: Color(0xffffffff),
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
                            'CREARME UNA CUENTA',
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
                        onTap: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text(
                          'Ya tienes una cuenta? Ingresa ahora!',
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
                    _isFetching
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue,
                              value: 5
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
