import 'package:flutter/foundation.dart';

class Post {
  final String confirmed;
  final int deaths;
  final String title;
  final int recovered;

  Post({
    @required this.confirmed,
    @required this.deaths,
    @required this.title,
    @required this.recovered,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      confirmed: json['confirmed'] as String,
      deaths: json['deaths'] as int,
      title: json['title'] as String,
      recovered: json['recovered'] as int,
    );
  }
}


