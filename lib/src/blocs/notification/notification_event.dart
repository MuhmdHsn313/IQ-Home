part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends NotificationEvent {}

class ReceiveSettings extends NotificationEvent {
  final AppSettingsState settingsState;

  const ReceiveSettings(this.settingsState);

  @override
  List<Object> get props => [settingsState];
}

class StartListener extends NotificationEvent {}

class StopListener extends NotificationEvent {}

class ReceiveNotification extends NotificationEvent {
  final News news;

  const ReceiveNotification(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => "ReceiveNotification { news: $news }";
}
