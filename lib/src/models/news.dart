import 'package:iqhome/src/utils/public_type.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'section.dart';
import 'source.dart';

class News extends Equatable {
  final int id;
  final DateTime lastChangedDateTime;
  final DateTime createDateTime;
  final String type;
  final String title;
  final String body;
  final String cover;
  final NewsStatus status;
  final List<Section> sections;
  final Source source;

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
