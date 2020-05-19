// To parse this JSON data, do
//
//     final tip = tipFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

class Tip extends Equatable {
  final int id ;
  final String title;
  final String cover;
  final String details;
  final List<String> links;

  List<Tip> tips ;

  Tip({
    @required this.id,
    @required this.title,
    @required this.cover,
    @required this.details,
    @required this.links,
  });

  Tip copyWith({
    int id ,
    String title,
    String cover,
    String details,
    List<String> links,
  }) =>
      Tip(
        id: id??this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        details: details ?? this.details,
        links: links ?? this.links,
      );

  @override
  List<Object> get props => [title, cover, details, links];

  factory Tip.fromRawJson(String str) => Tip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        details: json["details"],
        links: List<String>.from(json["links"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id":id,
        "title": title,
        "cover": cover,
        "details": details,
        "links": List<dynamic>.from(links.map((x) => x)),
      };
}
