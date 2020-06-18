part of '../models/area_statics.dart';

class AreaStaticsAdapter extends TypeAdapter<AreaStatics> {
  @override
  AreaStatics read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AreaStatics(
      name: fields[0] as String,
      cases: fields[1] as String,
      deaths: fields[2] as String,
      recovered: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AreaStatics obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.cases)
      ..writeByte(2)
      ..write(obj.deaths)
      ..writeByte(3)
      ..write(obj.recovered);
  }

  @override
  int get typeId => 10;
}
