import 'package:equatable/equatable.dart';
import 'package:iqhome/src/utils/public_type.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object> get props => [];
}

class FetchTheme extends AppSettingsEvent {}

class ChangeThemeMode extends AppSettingsEvent {
  final bool isDarkMode;

  const ChangeThemeMode(this.isDarkMode);

  @override
  List<Object> get props => [isDarkMode];

  @override
  String toString() => 'ChangeThemeMode { light mode: $isDarkMode }';
}

class ChangeNotificationState extends AppSettingsEvent {
  final bool isNotificationEnable;

  const ChangeNotificationState(this.isNotificationEnable);

  @override
  List<Object> get props => [isNotificationEnable];

  @override
  String toString() =>
      'ChangeNotificationState { notification state: $isNotificationEnable }';
}

class ChangeFontScale extends AppSettingsEvent {
  final AppFontScale fontScale;

  const ChangeFontScale(this.fontScale);

  @override
  List<Object> get props => [fontScale];

  @override
  String toString() => 'ChangeNotificationState { font scale: $fontScale }';
}
