import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part '../adapters/area_statics.dart';

@HiveType(typeId: 10)
class AreaStatics extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String cases;
  @HiveField(2)
  final String deaths;
  @HiveField(3)
  final String recovered;

  AreaStatics({
    @required this.name,
    @required this.cases,
    @required this.deaths,
    @required this.recovered,
  });

  factory AreaStatics.fromJson(Map<String, dynamic> data) {
    print(data);
    return AreaStatics(
      name: data['location'].toString(),
      cases: data['cases'].toString(),
      deaths: data['Deaths'].toString(),
      recovered: data['Recovered'].toString(),
    );
  }

  factory AreaStatics.fromGlobalJson(Map<String, dynamic> data) {
    print(data);
    return AreaStatics(
      name: data['Country'].toString(),
      cases: data['TotalConfirmed'].toString(),
      deaths: data['TotalDeaths'].toString(),
      recovered: data['TotalRecovered'].toString(),
    );
  }

  @override
  List<Object> get props => [
        this.name,
        this.cases,
        this.deaths,
        this.recovered,
      ];
}
