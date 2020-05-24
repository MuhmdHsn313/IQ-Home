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

  Future<void> _initialBox() async {
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
    await _initialBox();

    if (await _connectionChecker.hasConnection) {
      Response response = await _client.get(
        ApiReference.home(index ?? 0, fetch ?? 20),
      );
      final List list = json.decode(response.body);
      final newsList = List<News>.generate(
        list.length,
        (index) => News.fromJson(list[index]),
      );
      if (newsList.length > _newsBox.values.length) {
        for (int i = 0; i < newsList.length; i++) {
          if (i < _newsBox.values.length) {
            if (_newsBox.values.elementAt(i).id == newsList[i].id) {
              await _newsBox.put(
                newsList[i].id,
                newsList[i].copyWith(
                  seen: _newsBox.values.elementAt(i).seen,
                ),
              );
            }
          } else {
            await _newsBox.put(
              newsList[i].id,
              newsList[i],
            );
          }
        }
      } else if (newsList.length < _newsBox.values.length) {
        for (int i = 0; i < _newsBox.values.length; i++) {
          if (i < newsList.length) {
            if (_newsBox.values.elementAt(i).id == newsList[i].id) {
              await _newsBox.put(
                newsList[i].id,
                newsList[i].copyWith(
                  seen: _newsBox.values.elementAt(i).seen,
                ),
              );
            }
          } else {
            await _newsBox.delete(_newsBox.keyAt(i));
          }
        }
      } else {
        for (int i = 0; i < newsList.length; i++) {
          if (_newsBox.values.elementAt(i).id == newsList[i].id) {
            await _newsBox.put(
              newsList[i].id,
              newsList[i].copyWith(
                seen: _newsBox.values.elementAt(i).seen,
              ),
            );
          }
        }
      }
      yield _newsBox.values.toList();
    } else {
      yield _newsBox.values.toList();
    }
  }

  Future<void> updateSeen(News news) async {
    await _initialBox();
    return await _newsBox.put(
      news.id,
      news,
    );
  }

  Stream<BoxEvent> get listener => _newsBox.watch();

  void dispose() {
    _newsBox.close();
  }
}
