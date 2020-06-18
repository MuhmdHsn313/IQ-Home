import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part '../adapters/case.dart';

@HiveType(typeId: 13)
class AreaCase extends Equatable {
  @HiveField(0)
  final List<Case> deaths;
  @HiveField(1)
  final List<Case> recovered;
  @HiveField(2)
  final List<Case> active;
  @HiveField(3)
  final List<Case> recumbent;

  const AreaCase({
    @required this.deaths,
    @required this.recovered,
    @required this.active,
    @required this.recumbent,
  });

  factory AreaCase.fromJson(Map<String, dynamic> json) => AreaCase(
        deaths: List<Case>.generate(
          json['deaths'].length,
          (index) => Case.fromJson(json['deaths'][index]),
        ),
        recovered: List<Case>.generate(
          json['recovered'].length,
          (index) => Case.fromJson(json['deaths'][index]),
        ),
        active: List<Case>.generate(
          json['active'].length,
          (index) => Case.fromJson(json['deaths'][index]),
        ),
        recumbent: List<Case>.generate(
          json['recumbent'].length,
          (index) => Case.fromJson(json['deaths'][index]),
        ),
      );

  @override
  List<Object> get props => [
        ...deaths,
        ...recovered,
        ...active,
        ...recumbent,
      ];
}

@HiveType(typeId: 12)
class Case extends Equatable {
  @HiveField(0)
  final int total;
  @HiveField(1)
  final String date;

  const Case({
    @required this.total,
    @required this.date,
  });

  factory Case.fromJson(Map<String, dynamic> data) => Case(
        total: data['total'],
        date: data['caseDate'],
      );

  @override
  List<Object> get props => [total, date];
}
