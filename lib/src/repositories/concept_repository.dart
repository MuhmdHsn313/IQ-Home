import 'dart:convert';

import 'package:http/http.dart';
import 'package:iqhome/src/models/concept.dart';
import 'package:iqhome/src/repositories/home_repository.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class ConceptRepository extends HomeRepository<Concept> {
  @override
  Future<List<Concept>> fetch() async {
    await initialBox();

    if (await connectionChecker.hasConnection) {
      Response response = await client.get(ApiReference.concept);

      if (response.statusCode != 200) throw response.body;

      final list = jsonDecode(response.body) as List;
      final data = List<Concept>.generate(
        list.length,
        (index) => Concept.fromJson(list[index]),
      );
      box.clear();
      box.addAll(data);
      return data;
    } else {
      return box.values.toList();
    }
  }
}
