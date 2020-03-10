

class About {
  final String tagOne;
  final String tagTwo;
  final String aboutMe;

  About({this.tagOne, this.tagTwo, this.aboutMe});

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      tagOne: json['tag_one'],
      tagTwo: json['tag_two'],
      aboutMe: json['about_me'],
    );
  }

   Map<String, dynamic> toJson() =>
    {
      'tag_one': tagOne,
      'tag_two': tagTwo,
      'about_me': aboutMe,
    };
}
