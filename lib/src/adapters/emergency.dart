part of '../models/emergency.dart';

class EmergencyAdapter extends TypeAdapter<Emergency> {
  @override
  Emergency read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Emergency(
      id: fields[0] as int,
      name: fields[1] as String,
      contact: fields[2] as String,
      createDateTime: fields[3] as DateTime,
      lastChangedDateTime: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Emergency obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.createDateTime)
      ..writeByte(4)
      ..write(obj.lastChangedDateTime);
  }

  @override
  int get typeId => 7;
}
