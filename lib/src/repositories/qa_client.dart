
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:iqhome/src/models/qanda.dart';

class QandAApiClient {

  Future<List<QandA>> fetchQna() async {
  final tipUrl = 'https://cfi-covid19.herokuapp.com/api/qna/';
  final tipResponse = await http.get(tipUrl);

  if (tipResponse.statusCode != 200) {
    throw Exception('error getting tip  from url ');
  }

  final data = jsonDecode(tipResponse.body);
   List<QandA> qanda= QandA.fromJson(data).qanda;
  return qanda ;
}

}