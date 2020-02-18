import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class MeUser extends ChangeNotifier {
  User _data; 

  get data => _data;

  set data(User user) {
    this._data = user;
    notifyListeners();
  }

  static MeUser of (BuildContext context) => Provider.of<MeUser>(context);
}