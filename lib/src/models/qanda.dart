import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part '../adapters/qanda.dart';

@HiveType(typeId: 3)
class QandA extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String question;
  @HiveField(2)
  final String logo;
  @HiveField(3)
  final String answer;
  @HiveField(4)
  final String shortAnswer;

  QandA({
    @required this.id,
    @required this.question,
    @required this.logo,
    @required this.shortAnswer,
    @required this.answer,
  });

  QandA copyWith({
    int id,
    String question,
    String logo,
    String shortAnswer,
    String answer,
  }) =>
      QandA(
        id: id ?? this.id,
        question: question ?? this.question,
        logo: logo ?? this.logo,
        shortAnswer: shortAnswer ?? this.shortAnswer,
        answer: answer ?? this.answer,
      );

  @override
  List<Object> get props => [id, question, logo, shortAnswer, answer];

  factory QandA.fromRawJson(String str) => QandA.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QandA.fromJson(Map<String, dynamic> json) => QandA(
        id: json['id'],
        question: json["question"],
        logo: json["logo"],
        shortAnswer: json["shortAnswer"],
        answer: json["answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "logo": logo,
        "shortAnswer": shortAnswer,
        "answer": answer,
      };
}
