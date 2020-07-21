import 'dart:async';

import 'package:adhara_socket_io/adhara_socket_io.dart';

import '../models/news.dart';
import '../utils/api_reference.dart';

class NotificationRepository {
  static const _notification = 'notification';
  SocketIO _socket;
  SocketIOManager _manager;
  StreamSubscription<News> onNewsReceive;
  StreamController<News> _notificationController;

  NotificationRepository() {
    this._manager = SocketIOManager();
    _notificationController = new StreamController<News>();
  }
  Future<void> _connect(void listerner(News news)) async {
    this._socket = await _manager.createInstance(
      SocketOptions(ApiReference.channel_url),
    );
    _socket.connect();
    this._socket.onConnect((data) {
      print("Connected to notification channel...");
      _socket.emit("message", ["Hello world!"]);
    });
    onNewsReceive = _notificationController.stream.listen(listerner);
  }

  void startListening(void listerner(News news)) async {
    if (onNewsReceive == null)
      await _connect(listerner);
    else if (onNewsReceive.isPaused) onNewsReceive.resume();
    _socket.on(
      _notification,
      (data) => _notificationController.add(News.fromJson(data)),
    );
  }

  void stopListerner() => onNewsReceive.pause();
}
