import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

abstract class HomeRepository<T extends Equatable> {
  Box<T> box;
  final Client client;
  final DataConnectionChecker connectionChecker;

  HomeRepository()
      : client = Client(),
        connectionChecker = DataConnectionChecker();

  Future<void> initialBox() async {
    if (Hive.isBoxOpen('${T.toString()}'))
      box = Hive.box<T>('${T.toString()}');
    else
      box = await Hive.openBox<T>('${T.toString()}');
    connectionChecker.addresses = [
      AddressCheckOptions(
        InternetAddress('8.8.4.4'),
      ),
    ];
  }

  Future fetch() async {}

  Stream streamFetch() async* {}

  void dispose() {
    box.close();
    client.close();
  }
}
