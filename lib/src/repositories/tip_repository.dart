import 'dart:async';
import 'dart:convert';

import '../models/tip.dart';
import '../utils/api_reference.dart';
import 'home_repository.dart';

class TipRepository extends HomeRepository<Tip> {
  @override
  Future<List<Tip>> fetch([int index, int fetch]) async {
    await super.initialBox();
    if (await connectionChecker.hasConnection) {
      final tipResponse = await client.get(
        ApiReference.tips(
          index ?? 0,
          fetch ?? 10,
        ),
      );

      if (tipResponse.statusCode != 200) {
        if (box.isNotEmpty) return box.values.toList();
        throw Exception(tipResponse.body);
      }

      final List data = jsonDecode(tipResponse.body);
      final tips = List<Tip>.generate(
        data.length,
        (index) => Tip.fromJson(data[index]),
      );

      for (final tip in tips) {
        await box.put(tip.id, tip);
      }

      return tips;
    } else {
      return box.values.toList();
    }
  }
}
