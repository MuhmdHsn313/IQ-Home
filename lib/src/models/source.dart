import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Source extends Equatable {
  final int id;
  final String name;
  final String logo;
  final String webUrl;
  final String twitterUrl;
  final String telegramUrl;
  final String facebookUrl;
  final DateTime createDateTime;
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
      createDateTime: data['createDateTime'],
      lastChangedDateTime: data['lastChangedDateTime'],
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
