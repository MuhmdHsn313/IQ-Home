import 'dart:convert';
import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:iqhome/src/models/news.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class NewsRepository {
  Box<News> _newsBox;
  final Client _client;
  final DataConnectionChecker _connectionChecker;

  NewsRepository()
      : _client = new Client(),
        _connectionChecker = DataConnectionChecker();

  Future<void> initialBox() async {
    if (Hive.isBoxOpen('News'))
      _newsBox = Hive.box<News>('News');
    else
      _newsBox = await Hive.openBox<News>('News');
    _connectionChecker.addresses = [
      AddressCheckOptions(
        InternetAddress('8.8.4.4'),
      ),
    ];
  }

  Stream<List<News>> fetchNews([int index, int fetch]) async* {
    await initialBox();

    if (await _connectionChecker.hasConnection) {
      Response response = await _client.get(
        ApiReference.home(index ?? 0, fetch ?? 10),
      );
      final List list = json.decode(response.body);
      final newsList = List<News>.generate(
        list.length,
        (index) => News.fromJson(list[index]),
      );
      yield newsList;
      await _newsBox.clear();
      for (final news in newsList) {
        await _newsBox.put(news.id, news);
      }
    } else {
      yield _newsBox.values;
    }
  }

  Future<void> updateSeen(int id) {
    return _newsBox.put(
      id,
      _newsBox.get(id).copyWith(seen: true),
    );
  }

  Stream<BoxEvent> get listener => _newsBox.watch();
}
