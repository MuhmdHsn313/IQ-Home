import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:equatable/equatable.dart';

class QandA extends Equatable {
  final int id;
  final String question;
  final String logo;
  final String shortAnswer;
  final String answer;

  List<QandA> qanda ;

  QandA({
    @required this.id,
    @required this.question,
    @required this.logo,
    @required this.shortAnswer,
    @required this.answer,
  });

  QandA copyWith({
    int id ,
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
