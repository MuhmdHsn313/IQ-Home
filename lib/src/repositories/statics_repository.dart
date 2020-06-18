import 'dart:convert';

import 'package:hive/hive.dart';

import '../models/area_statics.dart';
import '../utils/api_reference.dart';
import 'home_repository.dart';

class StaticsRepository extends HomeRepository<AreaStatics> {
  Future<List<AreaStatics>> fetchLocal() async {
    await super.initialBox();

    if (await connectionChecker.hasConnection) {
      final areaResponse = await client.get(ApiReference.statics_url);

      if (areaResponse.statusCode != 200) {
        if (box.isNotEmpty) return box.values.toList();
        throw Exception(areaResponse.body);
      }
      final List data = jsonDecode(areaResponse.body);
      print(data);
      final areas = List<AreaStatics>.generate(
        data.length,
        (index) => AreaStatics.fromJson(data[index]),
      );
      box.clear();
      box.addAll(areas);
      return areas;
    } else {
      return box.values.toList();
    }
  }

  Future<List<AreaStatics>> fetchGlobal() async {
    Box box = await Hive.openBox('globalStatics');
    if (await connectionChecker.hasConnection) {
      final areaResponse = await client.get(ApiReference.global_url);

      if (areaResponse.statusCode != 200) {
        if (box.isNotEmpty) return box.values.toList();
        throw Exception(areaResponse.body);
      }
      final List data = jsonDecode(areaResponse.body)['Countries'];
      print(data);
      final areas = List<AreaStatics>.generate(
        data.length,
        (index) => AreaStatics.fromGlobalJson(data[index]),
      );
      box.clear();
      box.addAll(areas);

      return areas;
    } else {
      return box.values.toList();
    }
  }

// Future<Map<String, dynamic>> fetchLocalTotal() async {
//   _anyCache = await Hive.openBox('AnyCache');
//   if (await connectionChecker.hasConnection) {
//     final areaResponse = await client.get(ApiReference.localTotalStatistics);

//     if (areaResponse.statusCode != 200) {
//       if (box.isNotEmpty) return _anyCache.get('fetchLocalTotal');
//       throw Exception(areaResponse.body);
//     }
//     final total = jsonDecode(areaResponse.body);
//     print('fetchLocalTotal: ' + total.toString());
//     final Map<String, int> data = new Map<String, int>();
//     for (final single in total) {
//       print(single);
//       data[single.keys.first] = single.values.first;
//     }
//     _anyCache.put('fetchLocalTotal', data);

//     return data;
//   } else {
//     return _anyCache.get('fetchLocalTotal');
//   }
// }

// Future<AreaCase> fetchChart() async {
//   _anyCache = await Hive.openBox('AnyCache');
//   if (await connectionChecker.hasConnection) {
//     final areaResponse = await client.get(ApiReference.localChart);

//     if (areaResponse.statusCode != 200) {
//       if (box.isNotEmpty) return _anyCache.get('fetchChart');
//       throw Exception(areaResponse.body);
//     }
//     final Map total = jsonDecode(areaResponse.body);
//     final areaCase = AreaCase.fromJson(total);
//     _anyCache.put('fetchChart', areaCase);

//     return areaCase;
//   } else {
//     return _anyCache.get('fetchChart');
//   }
// }

// Future<AreaCase> fetchThisChart(int line) async {
//   _anyCache = await Hive.openBox('AnyCache');
//   if (await connectionChecker.hasConnection) {
//     final areaResponse = await client.get(ApiReference.thisChart(line));

//     if (areaResponse.statusCode != 200) {
//       if (box.isNotEmpty) return _anyCache.get('fetchThisChart$line');
//       throw Exception(areaResponse.body);
//     }
//     final List total = jsonDecode(areaResponse.body);
//     final Map<String, dynamic> data = new Map<String, dynamic>();

//     for (Map<String, dynamic> single in total)
//       data[single.keys.first] = single.values.first;

//     _anyCache.put('fetchThisChart$line', data);

//     return AreaCase.fromJson(data);
//   } else {
//     return _anyCache.get('fetchThisChart$line');
//   }
// }
}
