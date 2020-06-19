part of '../models/media.dart';

class MediaAdapter extends TypeAdapter<Media> {
  @override
  Media read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Media(
      id: fields[0] as int,
      title: fields[1] as String,
      videoId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Media obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.videoId);
  }

  @override
  int get typeId => 14;
}
