import 'package:iqhome/src/models/app_settings.dart';
import 'package:iqhome/src/utils/public_type.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class AppSettingsState extends Equatable {
  final double fontScale;
  final AppFontScale size;
  final bool isDarkMode;
  final bool isNotificationEnable;
  final String lang;

  const AppSettingsState({
    @required this.size,
    @required this.fontScale,
    @required this.isDarkMode,
    @required this.isNotificationEnable,
    this.lang,
  });

  factory AppSettingsState.initial() => AppSettingsState(
        size: AppFontScale.Middle,
        fontScale: 1,
        isDarkMode: false,
        isNotificationEnable: false,
        lang: 'ar',
      );

  factory AppSettingsState.fromData(AppSettings appSettings) {
    double fontScale;
    switch (appSettings.scale) {
      case AppFontScale.Small:
        fontScale = 0.8;
        break;
      case AppFontScale.Middle:
        fontScale = 1;
        break;
      case AppFontScale.Large:
        fontScale = 1.4;
        break;
      case AppFontScale.Giant:
        fontScale = 1.8;
        break;
    }
    return AppSettingsState(
      size: appSettings.scale,
      fontScale: fontScale,
      isDarkMode: appSettings.isDarkMode,
      isNotificationEnable: appSettings.isNotificationEnable,
    );
  }

  AppSettingsState copyWith({
    AppFontScale size,
    double fontScale,
    bool isDarkMode,
    bool isNotificationEnable,
    String lang,
  }) =>
      AppSettingsState(
        lang: lang ?? this.lang,
        size: size ?? this.size,
        fontScale: fontScale ?? this.fontScale,
        isDarkMode: isDarkMode ?? this.isDarkMode,
        isNotificationEnable: isNotificationEnable ?? this.isNotificationEnable,
      );

  @override
  List<Object> get props =>
      [lang, size, fontScale, isDarkMode, isNotificationEnable];
}
