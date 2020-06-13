import 'dart:async';
import 'dart:convert';

import '../models/emergency.dart';
import '../utils/api_reference.dart';
import 'home_repository.dart';

class EmergencyRepository extends HomeRepository<Emergency> {
  @override
  Future<List<Emergency>> fetch() async {
    await super.initialBox();
    if (await connectionChecker.hasConnection) {
      final tipResponse = await client.get(
        ApiReference.contact,
      );

      if (tipResponse.statusCode != 200) {
        if (box.isNotEmpty) return box.values.toList();
        throw Exception(tipResponse.body);
      }

      final List data = jsonDecode(tipResponse.body);
      final emergencies = List<Emergency>.generate(
        data.length,
        (index) => Emergency.fromJson(data[index]),
      );

      for (final emergency in emergencies) {
        await box.put(emergency.id, emergency);
      }

      return emergencies;
    } else {
      return box.values.toList();
    }
  }
}
