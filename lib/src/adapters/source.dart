// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/source.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourceAdapter extends TypeAdapter<Source> {
  @override
  Source read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Source(
      id: fields[0] as int,
      name: fields[1] as String,
      logo: fields[2] as String,
      webUrl: fields[3] as String,
      twitterUrl: fields[4] as String,
      telegramUrl: fields[5] as String,
      facebookUrl: fields[6] as String,
      createDateTime: fields[7] as DateTime,
      lastChangedDateTime: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.logo)
      ..writeByte(3)
      ..write(obj.webUrl)
      ..writeByte(4)
      ..write(obj.twitterUrl)
      ..writeByte(5)
      ..write(obj.telegramUrl)
      ..writeByte(6)
      ..write(obj.facebookUrl)
      ..writeByte(7)
      ..write(obj.createDateTime)
      ..writeByte(8)
      ..write(obj.lastChangedDateTime);
  }

  @override
  int get typeId => 2;
}
