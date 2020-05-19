import 'dart:async';
import 'package:iqhome/src/models/qanda.dart';
import 'package:iqhome/src/repositories/qa_client.dart';
import 'package:meta/meta.dart';



class QandARepository {
  final QandAApiClient qnaApiClient;

  QandARepository({@required this.qnaApiClient})
      : assert(qnaApiClient != null);

  Future<List<QandA>> getqna() async {
    
    return qnaApiClient.fetchQna();
  }
}