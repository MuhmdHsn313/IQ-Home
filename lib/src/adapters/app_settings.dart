part of '../models/app_settings.dart';

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  AppSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings(
      lang: fields[3] as String,
      scale: fields[0] as AppFontScale,
      isDarkMode: fields[1] as bool,
      isNotificationEnable: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.scale)
      ..writeByte(1)
      ..write(obj.isDarkMode)
      ..writeByte(2)
      ..write(obj.isNotificationEnable)
      ..writeByte(3)
      ..write(obj.lang);
  }

  @override
  int get typeId => 8;
}
