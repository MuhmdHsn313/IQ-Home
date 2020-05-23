import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iqhome/src/models/qanda.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class QandAApiClient {
  Future<List<QandA>> fetchQna() async {
    final tipResponse = await http.get(ApiReference.qna);

    if (tipResponse.statusCode != 200) {
      throw Exception('error getting tip  from url ');
    }

    final data = jsonDecode(tipResponse.body);
    List<QandA> qanda = QandA.fromJson(data).qanda;
    return qanda;
  }
}
