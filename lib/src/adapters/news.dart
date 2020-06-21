// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<News> {
  @override
  News read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      id: fields[0] as int,
      type: fields[2] as String,
      body: fields[1] as String,
      cover: fields[4] as String,
      title: fields[3] as String,
      status: fields[6] as NewsStatus,
      source: fields[5] as Source,
      sections: (fields[7] as List)?.cast<Section>(),
      createDateTime: fields[8] as DateTime,
      lastChangedDateTime: fields[9] as DateTime,
      seen: fields[10] as bool,
      subtitle: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.cover)
      ..writeByte(5)
      ..write(obj.source)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.sections)
      ..writeByte(8)
      ..write(obj.createDateTime)
      ..writeByte(9)
      ..write(obj.lastChangedDateTime)
      ..writeByte(10)
      ..write(obj.seen)
      ..writeByte(11)
      ..write(obj.subtitle);
  }

  @override
  int get typeId => 0;
}
