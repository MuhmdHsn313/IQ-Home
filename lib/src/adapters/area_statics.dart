part of '../models/area_statics.dart';

class AreaStaticsAdapter extends TypeAdapter<AreaStatics> {
  @override
  AreaStatics read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AreaStatics(
      id: fields[0] as int,
      name: fields[1] as String,
      today: fields[2] as Statics,
      total: fields[3] as Statics,
    );
  }

  @override
  void write(BinaryWriter writer, AreaStatics obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.today)
      ..writeByte(3)
      ..write(obj.total);
  }

  @override
  int get typeId => 10;
}
