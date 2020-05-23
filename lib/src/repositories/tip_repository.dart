import 'dart:async';
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/repositories/tip_client.dart';

class TipRepository {
  final TipApiClient tipApiClient;

  TipRepository() : tipApiClient = new TipApiClient();

  Future<List<Tip>> getTip() async {
    return await tipApiClient.fetchTip();
  }
}
