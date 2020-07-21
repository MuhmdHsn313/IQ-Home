import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:iqhome/src/repositories/notification_repository.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:workmanager/workmanager.dart';

import 'src/app.dart';
import 'src/blocs/app_settings/bloc.dart';
import 'src/blocs/notification/notification_bloc.dart';
import 'src/models/app_settings.dart';
import 'src/models/area_statics.dart';
import 'src/models/concept.dart';
import 'src/models/emergency.dart';
import 'src/models/media.dart';
import 'src/models/news.dart';
import 'src/models/qanda.dart';
import 'src/models/section.dart';
import 'src/models/source.dart';
import 'src/models/statics.dart';
import 'src/models/tip.dart';
import 'src/utils/public_type.dart';

final localNotifications = FlutterLocalNotificationsPlugin();

void callbackDispatcher() {
  final repository = NotificationRepository();
  final player = AudioPlayer();
  Workmanager.executeTask((task, inputData) async {
    print("Native called background task: notification");
    repository.startListening((news) {
      newsNotification(news);
    });
    await player.setAsset('assets/files/slow_spring_board.mp3');
    await player.play();
    return true;
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  localNotifications.initialize(
    InitializationSettings(
      AndroidInitializationSettings('drawable/ic_launcher'),
      IOSInitializationSettings(),
    ),
  );
  Workmanager.initialize(callbackDispatcher);
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
  Hive.registerAdapter(ConceptAdapter()); // 13
  Hive.registerAdapter(MediaAdapter()); // 14

  final appSettingsBloc = new AppSettingsBloc();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingsBloc>(
          create: (context) => appSettingsBloc..add(FetchTheme()),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(
            appSettingsBloc,
            context,
          )..add(AppStarted()),
        ),
      ],
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

void newsNotification(News news) async {
  final platform = MethodChannel('crossingthestreams.io/resourceResolver');
  String groupKey = 'org.codeforiraq.iqhome.WORK_EMAIL';
  String groupChannelId = 'grouped channel id';
  String groupChannelName = 'الاخبار';
  String groupChannelDescription = 'اشعار المستخدم بالاخبار الجديدة.';
  String alarmUri = await platform.invokeMethod('getAlarmUri');
  final x = UriAndroidNotificationSound(alarmUri);
  final androidDetails = new AndroidNotificationDetails(
    groupChannelId,
    groupChannelName,
    groupChannelDescription,
    importance: Importance.Max,
    priority: Priority.High,
    groupKey: groupKey,
    sound: x,
    styleInformation: BigTextStyleInformation(
      news.body,
      contentTitle: news.title,
      summaryText: 'اخر الاخبار!',
    ),
  );
  final notificationDetails = new NotificationDetails(
    androidDetails,
    IOSNotificationDetails(),
  );

  return await localNotifications.show(
    news.id,
    news.title,
    news.body,
    notificationDetails,
    payload: jsonEncode(news.toMap),
  );
}
