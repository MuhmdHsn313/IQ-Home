import 'dart:async';
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/repositories/tip_client.dart';
import 'package:meta/meta.dart';

class TipRepository {
  final TipApiClient tipApiClient;

  TipRepository({@required this.tipApiClient}) : assert(tipApiClient != null);

  Future<List<Tip>> getTip() async {
    return tipApiClient.fetchTip();
  }
}
