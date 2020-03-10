import 'dart:core';

import 'package:net_app/models/user.dart';
import 'package:timeago/timeago.dart' as timeago;

class Publication {
  final String description;
  final User user;
  final String createdAt;
  final String image;

  Publication({this.description, this.user, this.createdAt, this.image});

  factory Publication.fromJson(Map<String, dynamic> json) {
    final moment = DateTime.parse(json['created_at']);

    final createdAt = timeago.format(moment.toLocal(), locale: 'es');

    return Publication(
        description: json['description'],
        user: User.fromJson(json['user']),
        createdAt: createdAt,
        image: json['image']);
  }
}
