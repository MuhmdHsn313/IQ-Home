import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:iqhome/src/models/statics.dart';

part '../adapters/area_statics.dart';

@HiveType(typeId: 10)
class AreaStatics extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final Statics today;
  @HiveField(3)
  final Statics total;

  AreaStatics({
    @required this.id,
    @required this.name,
    @required this.today,
    @required this.total,
  })  : assert(id != null),
        assert(name != null);

  factory AreaStatics.fromJson(Map<String, dynamic> data) {
    return AreaStatics(
      id: data['id'],
      name: data['nameAr'],
      today: Statics.fromJson(data['today']),
      total: Statics.fromJson(data['total']),
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        total,
        today,
      ];
}
