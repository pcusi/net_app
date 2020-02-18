import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class Session {
  final key = "SESSION";
  final storage = FlutterSecureStorage();

  set(String token) async {
    final data = {
      "token": token,
    };
    await storage.write(key: key, value: jsonEncode(data));
  }

  get() async {
    final result = await storage.read(key: key);
    if (result != null) {
      return jsonDecode(result);
    }
    return null;
  }

  clear() async {
    await storage.deleteAll();
  }
}
