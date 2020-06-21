part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class InitialNotification extends NotificationState {}

class OnReceiveNotification extends NotificationState {
  final News news;

  const OnReceiveNotification(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => "OnReceiveNotification { news: $news }";
}
