part of '../models/case.dart';

class AreaCaseAdapter extends TypeAdapter<AreaCase> {
  @override
  AreaCase read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AreaCase(
      deaths: (fields[0] as List)?.cast<Case>(),
      recovered: (fields[1] as List)?.cast<Case>(),
      active: (fields[2] as List)?.cast<Case>(),
      recumbent: (fields[3] as List)?.cast<Case>(),
    );
  }

  @override
  void write(BinaryWriter writer, AreaCase obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.deaths)
      ..writeByte(1)
      ..write(obj.recovered)
      ..writeByte(2)
      ..write(obj.active)
      ..writeByte(3)
      ..write(obj.recumbent);
  }

  @override
  int get typeId => 13;
}

class CaseAdapter extends TypeAdapter<Case> {
  @override
  Case read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Case(
      total: fields[0] as int,
      date: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Case obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.date);
  }

  @override
  int get typeId => 12;
}
