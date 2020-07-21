part of '../models/concept.dart';

class ConceptAdapter extends TypeAdapter<Concept> {
  @override
  Concept read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Concept(
      title: fields[0] as String,
      details: fields[1] as String,
      link: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Concept obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj..link);
  }

  @override
  int get typeId => 15;
}
