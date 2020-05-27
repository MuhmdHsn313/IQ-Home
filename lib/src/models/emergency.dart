import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part '../adapters/emergency.dart';

@HiveType(typeId: 7)
class Emergency extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String contact;
  @HiveField(3)
  final DateTime createDateTime;
  @HiveField(4)
  final DateTime lastChangedDateTime;

  const Emergency({
    @required this.id,
    @required this.name,
    @required this.contact,
    @required this.createDateTime,
    @required this.lastChangedDateTime,
  });

  factory Emergency.fromJson(Map<String, dynamic> data) {
    return Emergency(
      id: data['id'],
      name: data['name'],
      contact: data['contact'],
      createDateTime: DateTime.parse(data['createDateTime']),
      lastChangedDateTime: DateTime.parse(data['lastChangedDateTime']),
    );
  }

  Emergency copyWith({
    int id,
    String name,
    String contact,
    DateTime createDataTime,
    DateTime lastChangedDataTime,
  }) {
    return Emergency(
      id: id ?? this.id,
      name: name ?? this.name,
      contact: contact ?? this.contact,
      createDateTime: createDataTime ?? this.contact,
      lastChangedDateTime: lastChangedDataTime ?? this.lastChangedDateTime,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        contact,
        createDateTime,
        lastChangedDateTime,
      ];
}
