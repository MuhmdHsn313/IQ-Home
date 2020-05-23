import 'dart:convert';
import 'dart:io';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/utils/api_reference.dart';

class TipApiClient {
  final DataConnectionChecker _connectionChecker;

  Box<Tip> _tipBox;

  TipApiClient() : _connectionChecker = new DataConnectionChecker();

  Future<void> _initialBox() async {
    if (Hive.isBoxOpen('Tips'))
      _tipBox = Hive.box<Tip>('Tips');
    else
      _tipBox = await Hive.openBox<Tip>('Tips');
    _connectionChecker.addresses = [
      AddressCheckOptions(
        InternetAddress('8.8.4.4'),
      ),
    ];
  }

  Future<List<Tip>> fetchTip([int index, int fetch]) async {
    _initialBox();
    if (await _connectionChecker.hasConnection) {
      final tipResponse = await http.get(
        ApiReference.tips(
          index ?? 0,
          fetch ?? 10,
        ),
      );

      if (tipResponse.statusCode != 200) {
        throw Exception(tipResponse.body);
      }

      final List data = jsonDecode(tipResponse.body);
      final tips = List<Tip>.generate(
        data.length,
        (index) => Tip.fromJson(data[index]),
      );

      for (final tip in tips) {
        await _tipBox.put(tip.id, tip);
      }

      return tips;
    } else {
      return _tipBox.values;
    }
  }
}
