import 'package:flutter/material.dart';
import 'package:net_app/models/user.dart';
import '../api/api.dart';
import '../providers/me_user.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _api = Api();

  MeUser _me;

  @override
  void initState() {
    super.initState();
    this.check();
  }

  check() async {
    final token = await _api.getAccessToken();
    if (token != null) {

      final result = await _api.getUserInfo(context, token);
      final user = User.fromJson(result);

      _me.data = user;
      
      Navigator.pushReplacementNamed(context, "/main");
    } else {
      if (_me.data == null) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    _me = MeUser.of(context);

    return Container(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
