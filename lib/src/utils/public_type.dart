import 'package:hive/hive.dart';

part '../adapters/public_type.dart';

@HiveType(typeId: 5)
enum AppFontScale {
  @HiveField(0)
  Small,
  @HiveField(1)
  Middle,
  @HiveField(2)
  Large,
  @HiveField(3)
  Giant,
}

@HiveType(typeId: 6)
enum NewsStatus {
  @HiveField(0)
  PUSHED,
  @HiveField(1)
  WAITING,
  @HiveField(2)
  FAILED,
}
