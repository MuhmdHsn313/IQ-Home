import 'dart:async';
import 'dart:convert';
import 'package:iqhome/src/models/qanda.dart';
import 'package:iqhome/src/utils/api_reference.dart';

import 'home_repository.dart';

class QandARepository extends HomeRepository<QandA> {
  @override
  Future<List<QandA>> fetch() async {
    await super.initialBox();
    if (await connectionChecker.hasConnection) {
      final qnaResponse = await client.get(
        ApiReference.qna,
      );

      if (qnaResponse.statusCode != 200) throw Exception(qnaResponse.body);

      final List data = jsonDecode(qnaResponse.body);
      final qnas = List<QandA>.generate(
        data.length,
        (index) => QandA.fromJson(data[index]),
      );

      for (final qna in qnas) {
        await box.put(qna.id, qna);
      }

      return qnas;
    } else {
      return box.values.toList();
    }
  }
}
