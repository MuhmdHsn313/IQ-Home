import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part '../adapters/section.dart';

@HiveType(typeId: 1)
class Section extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String body;
  @HiveField(2)
  final String cover;
  @HiveField(3)
  final DateTime createDateTime;
  @HiveField(4)
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

  Map<String, dynamic> get toMap => {
        'id': id,
        'body': body,
        'cover': cover,
        'createDateTime': createDateTime.toString(),
        'lastChangedDateTime': lastChangedDateTime.toString(),
      };

  @override
  List<Object> get props =>
      [id, body, cover, createDateTime, lastChangedDateTime];
}
