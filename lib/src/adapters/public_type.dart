// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../utils/public_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppFontSizeAdapter extends TypeAdapter<AppFontSize> {
  @override
  AppFontSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AppFontSize.Small;
      case 1:
        return AppFontSize.Middle;
      case 2:
        return AppFontSize.Large;
      case 3:
        return AppFontSize.Giant;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, AppFontSize obj) {
    switch (obj) {
      case AppFontSize.Small:
        writer.writeByte(0);
        break;
      case AppFontSize.Middle:
        writer.writeByte(1);
        break;
      case AppFontSize.Large:
        writer.writeByte(2);
        break;
      case AppFontSize.Giant:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get typeId => 5;
}

class NewsStatusAdapter extends TypeAdapter<NewsStatus> {
  @override
  NewsStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NewsStatus.PUSHED;
      case 1:
        return NewsStatus.WAITING;
      case 2:
        return NewsStatus.FAILED;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, NewsStatus obj) {
    switch (obj) {
      case NewsStatus.PUSHED:
        writer.writeByte(0);
        break;
      case NewsStatus.WAITING:
        writer.writeByte(1);
        break;
      case NewsStatus.FAILED:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get typeId => 6;
}