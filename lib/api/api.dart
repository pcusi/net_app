import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'config.dart';
import 'package:net_app/widgets/dialog.dart';
import 'session.dart';

class Api {
  final _session = Session();

  Future<bool> newUser(
    BuildContext context, {
    @required String names,
    @required String surnames,
    @required String username,
    @required String password,
  }) async {
    try {
      final url = "${Config.url}/new-user";

      final response = await http.post(url, body: {
        "names": names,
        "surnames": surnames,
        "username": username,
        "password": password,
      });

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Dialog.alert(context, title: "Bienvenido a .NET!");
        return true;
      } else if (response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }
      throw PlatformException(code: "201", message: "error /new-user");
    } on PlatformException catch (e) {
      Dialog.alert(context,
          title: 'Ups algo salió mal!', message: "${e.message}");
      return false;
    }
  }

  Future<bool> logIn(
    BuildContext context, {
    @required username,
    @required password,
  }) async {
    try {
      final url = "${Config.url}/log-In";

      final response = await http.post(url, body: {
        "username": username,
        "password": password,
      });

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = parsed['token'] as String;
        print("$token");

        //save token
        await _session.set(token);

        return true;
      } else if (response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }
      throw PlatformException(code: "201", message: "Error /log-In");
    } on PlatformException catch (e) {
      Dialog.alert(context,
          title: 'Ups algo salió mal!', message: "${e.message}");
      return false;
    }
  }

  Future<dynamic> getUserInfo(BuildContext context, String token) async {
    try {
      final url = "${Config.url}/user-profile";
      final response = await http.get(
        url,
        headers: {"Authorization": "Bearer $token"},
      );

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return parsed;
      } else if(response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }
        
      throw PlatformException(code: "201", message: "error /user-profile");
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
      return null;
    }
  }

  Future<String> getAccessToken() async {
    try {
      final result = await _session.get();
      if (result != null) {
        final token = result['token'] as String;
        await _session.set(token);
        return token;
      }
      return null;

    } on PlatformException catch(e) {
      print("Error ${e.code}: ${e.message}");
      return 'Hola';
    }
  }
}
