// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/section.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SectionAdapter extends TypeAdapter<Section> {
  @override
  Section read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Section(
      id: fields[0] as int,
      body: fields[1] as String,
      cover: fields[2] as String,
      createDateTime: fields[3] as DateTime,
      lastChangedDateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Section obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.cover)
      ..writeByte(3)
      ..write(obj.createDateTime)
      ..writeByte(4)
      ..write(obj.lastChangedDateTime);
  }

  @override
  int get typeId => 1;
}
