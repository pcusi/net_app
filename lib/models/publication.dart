import 'dart:core';

import 'package:net_app/models/user.dart';


class Publication {
  final String description;
  final User user;
  final String createdAt;
  final String image;

  Publication({this.description, this.user, this.createdAt, this.image});

  factory Publication.fromJson(Map<String, dynamic> json) {
    return Publication(
      description: json['description'],
      user: User.fromJson(json['user']),
      createdAt: json['created_at'],
      image: json['image']
    );
  }
}
