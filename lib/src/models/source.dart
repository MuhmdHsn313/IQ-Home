import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part '../adapters/source.dart';

@HiveType(typeId: 2)
class Source extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String logo;
  @HiveField(3)
  final String webUrl;
  @HiveField(4)
  final String twitterUrl;
  @HiveField(5)
  final String telegramUrl;
  @HiveField(6)
  final String facebookUrl;
  @HiveField(7)
  final DateTime createDateTime;
  @HiveField(8)
  final DateTime lastChangedDateTime;

  Source({
    @required this.id,
    @required this.name,
    @required this.logo,
    @required this.webUrl,
    @required this.twitterUrl,
    @required this.telegramUrl,
    @required this.facebookUrl,
    @required this.createDateTime,
    @required this.lastChangedDateTime,
  })  : assert(id != null),
        assert(name != null),
        assert(logo != null),
        assert(createDateTime != null),
        assert(lastChangedDateTime != null);

  factory Source.fromJson(Map<String, dynamic> data) {
    return Source(
      id: data['id'],
      name: data['name'],
      logo: data['logo'],
      webUrl: data['webUrl'],
      twitterUrl: data['twitterUrl'],
      telegramUrl: data['telegramUrl'],
      facebookUrl: data['facebookUrl'],
      createDateTime: DateTime.parse(data['createDateTime']),
      lastChangedDateTime: DateTime.parse(data['lastChangedDateTime']),
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        logo,
        createDateTime,
        lastChangedDateTime,
        webUrl,
        twitterUrl,
        telegramUrl,
        facebookUrl,
      ];
}
