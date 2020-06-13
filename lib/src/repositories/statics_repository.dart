import 'dart:convert';

import '../models/area_statics.dart';
import '../utils/api_reference.dart';
import 'home_repository.dart';

class StaticsRepository extends HomeRepository<AreaStatics> {
  Future fetchLocal() async {
    await super.initialBox();

    if (await connectionChecker.hasConnection) {
      final areaResponse = await client.get(ApiReference.localStatistics);

      if (areaResponse.statusCode != 200) {
        if (box.isNotEmpty) return box.values.toList();
        throw Exception(areaResponse.body);
      }
      final List data = jsonDecode(areaResponse.body);
      final areas = List<AreaStatics>.generate(
        data.length,
        (index) => AreaStatics.fromJson(data[index]),
      );

      for (final area in areas) {
        await box.put(area.id, area);
      }

      return areas;
    } else {
      return box.values.toList();
    }
  }
}
