import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  UsersPage({Key key}) : super(key: key);

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Text('USERS'),
    );
  }
}