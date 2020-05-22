// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/tip.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TipAdapter extends TypeAdapter<Tip> {
  @override
  Tip read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tip(
      id: fields[0] as int,
      title: fields[1] as String,
      cover: fields[2] as String,
      details: fields[3] as String,
      links: (fields[4] as List)?.cast<String>(),
    )..tips = (fields[5] as List)?.cast<Tip>();
  }

  @override
  void write(BinaryWriter writer, Tip obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.cover)
      ..writeByte(3)
      ..write(obj.details)
      ..writeByte(4)
      ..write(obj.links)
      ..writeByte(5)
      ..write(obj.tips);
  }

  @override
  int get typeId => 4;
}
