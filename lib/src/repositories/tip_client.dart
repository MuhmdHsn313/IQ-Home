import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iqhome/src/models/tip.dart';

class TipApiClient {
  Future<List<Tip>> fetchTip() async {
    final tipUrl = 'https://cfi-covid19.herokuapp.com/api/tip/';
    final tipResponse = await http.get(tipUrl);

    if (tipResponse.statusCode != 200) {
      throw Exception('error getting tip  from url ');
    }

    final data = jsonDecode(tipResponse.body);
    List<Tip> tips = Tip.fromJson(data).tips;
    return tips;
  }
}
