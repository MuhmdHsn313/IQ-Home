import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part '../adapters/statics.dart';

@HiveType(typeId: 9)
class Statics extends Equatable {
  @HiveField(0)
  final int active;
  @HiveField(1)
  final int deaths;
  @HiveField(2)
  final int recovered;

  const Statics({
    @required this.active,
    @required this.deaths,
    @required this.recovered,
  })  : assert(active != null),
        assert(deaths != null),
        assert(recovered != null);

  factory Statics.fromJson(Map<String, dynamic> data) {
    return Statics(
      active: data['active'] ?? 0,
      deaths: data['deaths'] ?? 0,
      recovered: data['recovered'] ?? 0,
    );
  }

  @override
  List<Object> get props => [active, deaths, recovered];
}
