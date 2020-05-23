import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'src/app.dart';
import 'src/models/tip.dart';
import 'src/models/qanda.dart';
import 'src/models/news.dart';
import 'src/models/section.dart';
import 'src/models/source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final currentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(currentDir.path);
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(TipAdapter());
  Hive.registerAdapter(QandAAdapter());
  Hive.registerAdapter(SectionAdapter());
  Hive.registerAdapter(SourceAdapter());
  runApp(IQHome());
}
