import 'package:hive/hive.dart';
import 'package:iqhome/src/utils/public_type.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part '../adapters/app_settings.dart';

@HiveType(typeId: 8)
class AppSettings extends Equatable {
  @HiveField(0)
  final AppFontScale scale;
  @HiveField(1)
  final bool isDarkMode;
  @HiveField(2)
  final bool isNotificationEnable;
  @HiveField(3)
  final String lang;

  const AppSettings({
    @required this.lang,
    @required this.scale,
    @required this.isDarkMode,
    @required this.isNotificationEnable,
  });

  AppSettings copyWith({
    String lang,
    AppFontScale scale,
    bool isDarkMode,
    bool isNotificationEnable,
  }) =>
      AppSettings(
        lang: lang ?? this.lang,
        scale: scale ?? this.scale,
        isDarkMode: isDarkMode ?? this.isDarkMode,
        isNotificationEnable: isNotificationEnable ?? this.isNotificationEnable,
      );

  @override
  List<Object> get props => [
        lang,
        scale,
        isDarkMode,
        isNotificationEnable,
      ];
}
