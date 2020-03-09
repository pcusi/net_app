class User {
  String id;
  String names;
  String surnames;

  User({
    this.names,
    this.surnames,
    this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      names: json['names'],
      surnames: json['surnames'],
    );
  }

}
