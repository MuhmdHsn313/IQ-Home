import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class TipApiClient {
  Future<List<Tip>> fetchTip([int index, int fetch]) async {
    final tipResponse = await http.get(
      ApiReference.tips(
        index ?? 0,
        fetch ?? 10,
      ),
    );

    if (tipResponse.statusCode != 200) {
      throw Exception('error getting tip  from url ');
    }

    final data = jsonDecode(tipResponse.body);
    List<Tip> tips = Tip.fromJson(data).tips;
    return tips;
  }
}
