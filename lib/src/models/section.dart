import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final int id;
  final String body;
  final String cover;
  final DateTime createDateTime;
  final DateTime lastChangedDateTime;

  const Section({
    @required this.id,
    @required this.body,
    @required this.cover,
    @required this.createDateTime,
    @required this.lastChangedDateTime,
  })  : assert(id != null),
        assert(body != null),
        assert(cover != null),
        assert(createDateTime != null),
        assert(lastChangedDateTime != null);

  factory Section.fromJson(Map<String, dynamic> data) {
    return Section(
      id: data['id'],
      body: data['body'],
      cover: data['cover'],
      createDateTime: DateTime.parse(data['createDateTime']),
      lastChangedDateTime: DateTime.parse(data['lastChangedDateTime']),
    );
  }

  @override
  List<Object> get props =>
      [id, body, cover, createDateTime, lastChangedDateTime];
}
