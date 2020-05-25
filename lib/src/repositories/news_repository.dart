import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:iqhome/src/models/news.dart';
import 'package:iqhome/src/repositories/home_repository.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class NewsRepository extends HomeRepository<News> {
  Stream<List<News>> streamFetch([int index, int fetch]) async* {
    await super.initialBox();
    if (await connectionChecker.hasConnection) {
      Response response = await client.get(
        ApiReference.home(index ?? 0, fetch ?? 20),
      );
      final List list = json.decode(response.body);
      final newsList = List<News>.generate(
        list.length,
        (index) => News.fromJson(list[index]),
      );
      if (newsList.length > box.values.length) {
        for (int i = 0; i < newsList.length; i++) {
          if (i < box.values.length) {
            if (box.values.elementAt(i).id == newsList[i].id) {
              await box.put(
                newsList[i].id,
                newsList[i].copyWith(
                  seen: box.values.elementAt(i).seen,
                ),
              );
            }
          } else {
            await box.put(
              newsList[i].id,
              newsList[i],
            );
          }
        }
      } else if (newsList.length < box.values.length) {
        for (int i = 0; i < box.values.length; i++) {
          if (i < newsList.length) {
            if (box.values.elementAt(i).id == newsList[i].id) {
              await box.put(
                newsList[i].id,
                newsList[i].copyWith(
                  seen: box.values.elementAt(i).seen,
                ),
              );
            }
          } else {
            await box.delete(box.keyAt(i));
          }
        }
      } else {
        for (int i = 0; i < newsList.length; i++) {
          if (box.values.elementAt(i).id == newsList[i].id) {
            await box.put(
              newsList[i].id,
              newsList[i].copyWith(
                seen: box.values.elementAt(i).seen,
              ),
            );
          }
        }
      }
      yield box.values.toList();
    } else {
      yield box.values.toList();
    }
  }

  Future<void> updateSeen(News news) async {
    super.initialBox();
    return await box.put(
      news.id,
      news,
    );
  }

  Stream<BoxEvent> get listener => box.watch();
}
