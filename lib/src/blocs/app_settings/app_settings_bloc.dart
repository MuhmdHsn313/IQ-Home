import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:iqhome/src/models/app_settings.dart';
import 'package:iqhome/src/utils/public_type.dart';
import './bloc.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettings _appSettings;
  Box<AppSettings> _settingsBox;

  @override
  AppSettingsState get initialState => AppSettingsState.initial();

  @override
  Stream<AppSettingsState> mapEventToState(
    AppSettingsEvent event,
  ) async* {
    if (event is FetchTheme) {
      _settingsBox = await Hive.openBox('SettingsBox');
      if (_settingsBox.isEmpty) {
        _appSettings = AppSettings(
          lang: 'ar',
          scale: AppFontScale.Middle,
          isDarkMode: false,
          isNotificationEnable: false,
        );
        _settingsBox.put(1, _appSettings);
      } else {
        _appSettings = _settingsBox.values.first;
      }
      yield AppSettingsState.fromData(_appSettings);
    }

    if (event is ChangeThemeMode) {
      yield state.copyWith(isDarkMode: event.isDarkMode);
      _settingsBox.put(
        1,
        _appSettings.copyWith(
          isDarkMode: event.isDarkMode,
        ),
      );
    }
    if (event is ChangeFontScale) {
      double scale;
      switch (event.fontScale) {
        case AppFontScale.Small:
          scale = 0.8;
          break;
        case AppFontScale.Middle:
          scale = 1;
          break;
        case AppFontScale.Large:
          scale = 1.4;
          break;
        case AppFontScale.Giant:
          scale = 1.8;
          break;
      }

      yield state.copyWith(fontScale: scale, size: event.fontScale);
      _settingsBox.put(
        1,
        _appSettings.copyWith(
          scale: event.fontScale,
        ),
      );
    }
    if (event is ChangeNotificationState) {
      yield state.copyWith(isNotificationEnable: event.isNotificationEnable);
      _settingsBox.put(
        1,
        _appSettings.copyWith(
          isNotificationEnable: event.isNotificationEnable,
        ),
      );
    }
  }
}
