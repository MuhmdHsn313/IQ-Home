import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part '../adapters/media.dart';

@HiveType(typeId: 14)
class Media extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String videoId;

  const Media({
    @required this.id,
    @required this.title,
    @required this.videoId,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    final String url = json['url'];

    return Media(
      id: json['id'],
      title: json['title'],
      videoId: url.contains('youtu.be')
          ? url.split('/').last
          : url.split('=').last,
    );
  }

  Media copyWith({
    int id,
    String title,
    String videoId,
  }) =>
      Media(
        id: id ?? this.id,
        title: title ?? this.title,
        videoId: videoId ?? this.videoId,
      );

  @override
  List<Object> get props => [id, title, videoId];
}
