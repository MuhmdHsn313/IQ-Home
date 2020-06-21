import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../models/news.dart';
import '../../repositories/notification_repository.dart';
import '../../screens/news_screen.dart';
import '../app_settings/bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final BuildContext context;
  AppSettingsBloc _settingsBloc;
  NotificationRepository _repository;
  FlutterLocalNotificationsPlugin _localNotifications;
  NotificationBloc(this._settingsBloc, this.context)
      : _repository = new NotificationRepository();

  @override
  NotificationState get initialState {
    _localNotifications = FlutterLocalNotificationsPlugin();
    _localNotifications.initialize(
      InitializationSettings(
        AndroidInitializationSettings('mipmap/ic_launcher'),
        IOSInitializationSettings(),
      ),
      onSelectNotification: (_) async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsScreen(
              news: News.fromJson(
                jsonDecode(_),
              ),
            ),
          ),
        );
      },
    );
    return InitialNotification();
  }

  @override
  Stream<NotificationState> mapEventToState(
    NotificationEvent event,
  ) async* {
    if (event is AppStarted) {
      _settingsBloc.listen((_) {
        add(ReceiveSettings(_));
      });
    }

    if (event is ReceiveSettings) {
      if (event.settingsState.isNotificationEnable) {
        _repository.startListening(
          (news) => add(ReceiveNotification(news)),
        );
      } else {
        _repository.stopListerner();
      }
    }

    if (event is ReceiveNotification) {
      newsNotification(event.news);
      yield OnReceiveNotification(event.news);
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

    return await _localNotifications.show(
      news.id,
      news.title,
      news.body,
      notificationDetails,
      payload: jsonEncode(news.toMap),
    );
  }
}
