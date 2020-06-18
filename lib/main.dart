import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:iqhome/src/models/case.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'src/app.dart';
import 'src/blocs/app_settings/app_settings_bloc.dart';
import 'src/blocs/app_settings/app_settings_event.dart';
import 'src/models/app_settings.dart';
import 'src/models/area_statics.dart';
import 'src/models/emergency.dart';
import 'src/models/news.dart';
import 'src/models/qanda.dart';
import 'src/models/section.dart';
import 'src/models/source.dart';
import 'src/models/statics.dart';
import 'src/models/tip.dart';
import 'src/utils/public_type.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final currentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(currentDir.path);
  Hive.registerAdapter(NewsAdapter()); // 1
  Hive.registerAdapter(TipAdapter()); // 2
  Hive.registerAdapter(QandAAdapter()); // 3
  Hive.registerAdapter(SectionAdapter()); // 4
  Hive.registerAdapter(SourceAdapter()); // 5
  Hive.registerAdapter(AppFontSizeAdapter()); // 6
  Hive.registerAdapter(NewsStatusAdapter()); // 7
  Hive.registerAdapter(EmergencyAdapter()); // 8
  Hive.registerAdapter(AppSettingsAdapter()); // 9
  Hive.registerAdapter(StaticsAdapter()); // 10
  Hive.registerAdapter(AreaStaticsAdapter()); // 11
  Hive.registerAdapter(CaseAdapter()); // 12
  Hive.registerAdapter(AreaCaseAdapter()); // 13
  runApp(
    BlocProvider<AppSettingsBloc>(
      create: (context) => AppSettingsBloc()..add(FetchTheme()),
      child: IQHome(),
    ),
  );
}
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}
