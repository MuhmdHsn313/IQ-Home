import 'dart:convert';

import 'package:iqhome/src/models/source.dart';
import 'package:iqhome/src/utils/api_reference.dart';

import 'home_repository.dart';

class SourceRepository extends HomeRepository<Source> {
  @override
  Future<List<Source>> fetch() async {
    await super.initialBox();
    if (await connectionChecker.hasConnection) {
      final sourceResponse = await client.get(
        ApiReference.sources,
      );
      print(sourceResponse.statusCode);
      if (sourceResponse.statusCode != 200) {
        if(box.isNotEmpty)
          return box.values.toList();
        throw Exception(sourceResponse.body);
      }

      final List data = jsonDecode(sourceResponse.body);
      final sources = List<Source>.generate(
        data.length,
        (index) => Source.fromJson(data[index]),
      );

      for (final source in sources) {
        await box.put(source.id, source);
      }

      return sources;
    } else {
      return box.values.toList();
    }
  }
}
