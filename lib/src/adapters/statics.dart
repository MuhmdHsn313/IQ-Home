part of '../models/statics.dart';

class StaticsAdapter extends TypeAdapter<Statics> {
  @override
  Statics read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Statics(
      active: fields[0] as int,
      deaths: fields[1] as int,
      recovered: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Statics obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.active)
      ..writeByte(1)
      ..write(obj.deaths)
      ..writeByte(2)
      ..write(obj.recovered);
  }

  @override
  int get typeId => 9;
}
