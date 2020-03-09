import 'dart:core';

import 'package:net_app/models/user.dart';
import 'package:simple_moment/simple_moment.dart';

class Publication {
  final String description;
  final User user;
  final String createdAt;
  final String image;

  Publication({this.description, this.user, this.createdAt, this.image});

  factory Publication.fromJson(Map<String, dynamic> json) {
    final moment = Moment.parse(json['created_at']);

    return Publication(
        description: json['description'],
        user: User.fromJson(json['user']),
        createdAt: moment.fromNow(),
        image: json['image']);
  }
}
