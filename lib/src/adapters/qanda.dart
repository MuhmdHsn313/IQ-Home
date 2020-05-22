// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/qanda.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QandAAdapter extends TypeAdapter<QandA> {
  @override
  QandA read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QandA(
      id: fields[0] as int,
      question: fields[1] as String,
      logo: fields[2] as String,
      shortAnswer: fields[4] as String,
      answer: fields[3] as String,
    )..qanda = (fields[5] as List)?.cast<QandA>();
  }

  @override
  void write(BinaryWriter writer, QandA obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.logo)
      ..writeByte(3)
      ..write(obj.answer)
      ..writeByte(4)
      ..write(obj.shortAnswer)
      ..writeByte(5)
      ..write(obj.qanda);
  }

  @override
  int get typeId => 3;
}
