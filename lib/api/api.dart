import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:net_app/models/about.dart';
import 'package:net_app/models/publication.dart';
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

  //request from the api for access to the Application
  Future<bool> logIn(
    BuildContext context, {
    @required username, //required username created for ther user
    @required password, //required password created for the user
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

        //save token
        await _session
            .set(token); //save in the storage the token generated for the logIn

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

  //get the user info logged
  Future<dynamic> getUserInfo(BuildContext context, String token) async {
    try {
      final url = "${Config.url}/user-profile";
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $token"
        }, //important in the api we need type the Authorization headers, you can see too in the postman or any rest client tester
      );

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return parsed;
      } else if (response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }

      throw PlatformException(code: "201", message: "error /user-profile");
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
      return null;
    }
  }

  //here we storage the token created in the logIn function, very important for any request that dependes user._id
  Future<String> getAccessToken() async {
    try {
      final result = await _session.get();
      if (result != null) {
        final token = result['token'] as String;
        await _session.set(token);
        return token;
      }
      return null;
    } on PlatformException catch (e) {
      print("Error ${e.code}: ${e.message}");
      return null;
    }
  }

  Future<List<Publication>> getPublications(
      BuildContext context, String token) async {
    try {
      final url = "${Config.url}/publications";

      final response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        final parsed = jsonDecode(response.body);

        final list = parsed['publications'] as List;

        List<Publication> publications =
            list.map((i) => Publication.fromJson(i)).toList();

        return publications;
      }
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
    }
    return null;
  }

  //user biography need 3 parameters first the token of the user, compare the token with the id, if id != to the token, means that description of the users doesn't exists.
  Future<dynamic> getUserDescription(
      BuildContext context, String token, String id) async {
    //parameters token, id
    try {
      final url = "${Config.url}/about/$id";

      final response =
          await http.get(url, headers: {"Authorization": "Bearer $token"});
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return About.fromJson(
            parsed); //we need parse the user description or biography from the api rest
      }
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
      return null;
    }
  }

  Future<bool> createPublication(BuildContext context, String token,
      {@required String description}) async {
    try {
      final url = "${Config.url}/new-publication";

      final response = await http.post(url,
          body: {"description": description},
          headers: {"Authorization": "Bearer $token"});
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true; //we need parse the user description or biography from the api rest
      } else if (response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }
      throw PlatformException(code: "201", message: "error /new-publication");
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
      return false;
    }
  }

  Future<bool> createAbout(BuildContext context, String token,
      {@required String tagOne,
      @required String tagTwo,
      @required String aboutMe}) async {
    try {
      final url = "${Config.url}/about-user";

      final response = await http.post(
        url,
        body: {"tag_one": tagOne, "tag_two": tagTwo, "about_me": aboutMe},
        headers: {"Authorization": "Bearer $token"},
      );
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true; //we need parse the user description or biography from the api rest
      } else if (response.statusCode == 500) {
        throw PlatformException(code: "500", message: parsed['message']);
      }
      throw PlatformException(code: "201", message: "error /new-publication");
    } on PlatformException catch (e) {
      Dialog.alert(context, title: "ERROR", message: e.message);
      return false;
    }
  }
}
