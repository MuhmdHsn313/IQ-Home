import 'dart:convert';

import 'package:http/http.dart';
import 'package:iqhome/src/models/media.dart';
import 'package:iqhome/src/repositories/home_repository.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class MediaRepository extends HomeRepository<Media> {
  @override
  Future<List<Media>> fetch() async {
    await initialBox();

    if (await connectionChecker.hasConnection) {
      Response response = await client.get(ApiReference.media(0, 10));

      if (response.statusCode != 200) throw response.body;

      final list = jsonDecode(response.body) as List;
      final data = List<Media>.generate(
        list.length,
        (index) => Media.fromJson(list[index]),
      );
      box.clear();
      box.addAll(data);
      return data;
    } else {
      return box.values.toList();
    }
  }
}
