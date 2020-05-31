import 'dart:async';
import 'dart:convert';
import 'package:iqhome/src/models/emergency.dart';
import 'package:iqhome/src/repositories/home_repository.dart';
import 'package:iqhome/src/utils/api_reference.dart';

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
