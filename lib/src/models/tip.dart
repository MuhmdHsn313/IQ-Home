// To parse this JSON data, do
//
//     final tip = tipFromJson(jsonString);

import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';

part '../adapters/tip.dart';

@HiveType(typeId: 4)
class Tip extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String cover;
  @HiveField(3)
  final String details;
  @HiveField(4)
  final List<Map<String, String>> links;

  Tip({
    @required this.id,
    @required this.title,
    @required this.cover,
    @required this.details,
    @required this.links,
  });

  Tip copyWith({
    int id,
    String title,
    String cover,
    String details,
    List<Map<String, String>> links,
  }) =>
      Tip(
        id: id ?? this.id,
        title: title ?? this.title,
        cover: cover ?? this.cover,
        details: details ?? this.details,
        links: links ?? this.links,
      );

  @override
  List<Object> get props => [title, cover, details]..addAll(links);

  factory Tip.fromRawJson(String str) => Tip.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tip.fromJson(Map<String, dynamic> json) => Tip(
        id: json["id"],
        title: json["title"],
        cover: json["cover"],
        details: json["details"],
        links: json['links'] == null
            ? []
            : List<Map<String, String>>.generate(
                json['links'].length,
                (index) => {
                  'title': json['links'][index]['title'],
                  'url': json['links'][index]['url'],
                },
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "cover": cover,
        "details": details,
        "links": List<dynamic>.from(links.map((x) => x)),
      };
}
