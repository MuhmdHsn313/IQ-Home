import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../utils/public_type.dart';
import 'section.dart';
import 'source.dart';

part '../adapters/news.dart';

@HiveType(typeId: 0)
class News extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String cover;
  @HiveField(5)
  final Source source;
  @HiveField(6)
  final NewsStatus status;
  @HiveField(7)
  final List<Section> sections;
  @HiveField(8)
  final DateTime createDateTime;
  @HiveField(9)
  final DateTime lastChangedDateTime;
  @HiveField(10)
  final bool seen;
  @HiveField(11)
  final String subtitle;

  const News({
    @required this.id,
    @required this.type,
    @required this.body,
    @required this.cover,
    @required this.title,
    @required this.status,
    @required this.source,
    @required this.sections,
    @required this.createDateTime,
    @required this.lastChangedDateTime,
    @required this.subtitle,
    this.seen: false,
  })  : assert(id != null),
        assert(type != null),
        assert(body != null),
        // assert(seen != null), TODO: check this bug.
        assert(cover != null),
        assert(title != null),
        assert(status != null),
        assert(source != null),
        assert(sections != null),
        assert(createDateTime != null),
        assert(lastChangedDateTime != null);

  factory News.fromJson(Map<String, dynamic> data) {
    NewsStatus status;

    if (data['status'] == 'PUSHED')
      status = NewsStatus.PUSHED;
    else if (data['status'] == 'FAILED')
      status = NewsStatus.FAILED;
    else
      status = NewsStatus.WAITING;

    return News(
      id: data['id'],
      type: data['type'],
      body: data['body'],
      cover: data['cover'],
      title: data['title'],
      subtitle: data['subtitle'],
      status: status,
      source: Source.fromJson(data['source']),
      sections: List<Section>.generate(
        data['sections'].length,
        (index) => Section.fromJson(data['sections'][index]),
      ),
      createDateTime: DateTime.parse(data['createDateTime']).toLocal(),
      lastChangedDateTime:
          DateTime.parse(data['lastChangedDateTime']).toLocal(),
    );
  }

  News copyWith({
    int id,
    String title,
    String type,
    String body,
    String cover,
    String subtitle,
    NewsStatus status,
    Source source,
    List<Section> sections,
    DateTime createDateTime,
    DateTime lastChangedDataTime,
    bool seen,
  }) {
    return News(
      id: id ?? this.id,
      type: type ?? this.type,
      body: body ?? this.body,
      seen: seen ?? this.seen,
      cover: cover ?? this.cover,
      title: title ?? this.title,
      status: status ?? this.status,
      source: source ?? this.source,
      subtitle: subtitle ?? this.subtitle,
      sections: sections ?? this.sections,
      createDateTime: createDateTime ?? this.createDateTime,
      lastChangedDateTime: lastChangedDataTime ?? this.lastChangedDateTime,
    );
  }

  Map<String, dynamic> get toMap => {
        'id': id,
        'type': type,
        'body': body,
        'seen': seen,
        'cover': cover,
        'title': title,
        'status': status.toString().split('.').last,
        'source': jsonEncode(source.toMap),
        'subtitle': subtitle,
        'sections': List<Map>.generate(
          sections.length,
          (index) => sections[index].toMap,
        ),
        'createDateTime': createDateTime.toString(),
        'lastChangedDateTime': lastChangedDateTime.toString(),
      };

  @override
  List<Object> get props => [
        id,
        type,
        body,
        seen,
        cover,
        title,
        status,
        source,
        subtitle,
        createDateTime,
        lastChangedDateTime,
      ]..addAll(sections);
}
