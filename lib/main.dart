import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
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
  final currentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(currentDir.path);
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(TipAdapter());
  Hive.registerAdapter(QandAAdapter());
  Hive.registerAdapter(SectionAdapter());
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(AppFontSizeAdapter());
  Hive.registerAdapter(NewsStatusAdapter());
  Hive.registerAdapter(EmergencyAdapter());
  Hive.registerAdapter(AppSettingsAdapter());
  Hive.registerAdapter(StaticsAdapter());
  Hive.registerAdapter(AreaStaticsAdapter());
  runApp(
    BlocProvider<AppSettingsBloc>(
      create: (context) => AppSettingsBloc()..add(FetchTheme()),
      child: IQHome(),
    ),
  );
}
