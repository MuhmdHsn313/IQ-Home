import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part '../adapters/concept.dart';

@HiveType(typeId: 15)
class Concept extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String details;
  @HiveField(2)
  final String link;

  const Concept({
    @required this.title,
    @required this.details,
    @required this.link,
  });

  factory Concept.fromJson(Map<String, dynamic> json) {
    return Concept(
      title: json['title'],
      details: json['details'],
      link: json['link'],
    );
  }

  Concept copyWith({
    String title,
    String details,
    String link,
  }) =>
      Concept(
        title: title ?? this.title,
        details: details ?? this.details,
        link: link ?? this.link,
      );

  @override
  List<Object> get props => [title, details, link];
}
