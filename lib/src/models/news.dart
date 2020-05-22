import 'package:hive/hive.dart';
import 'package:iqhome/src/utils/public_type.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

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
  })  : assert(id != null),
        assert(type != null),
        assert(body != null),
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
      status: status,
      source: Source.fromJson(data['source']),
      sections: List<Section>.generate(
        data['sections'].length,
        (index) => Section.fromJson(data['sections'][index]),
      ),
      createDateTime: DateTime.parse(data['createDateTime']),
      lastChangedDateTime: DateTime.parse(data['lastChangedDateTime']),
    );
  }

  @override
  List<Object> get props => [
        id,
        type,
        body,
        cover,
        title,
        status,
        source,
        createDateTime,
        lastChangedDateTime,
      ]..addAll(sections);
}
