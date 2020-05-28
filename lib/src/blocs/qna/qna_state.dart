import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/qanda.dart';
import 'package:meta/meta.dart';

abstract class QnAState extends Equatable {
  const QnAState();

  @override
  List<Object> get props => [];
}

class QnALoadingState extends QnAState {}

class QnALoadedState extends QnAState {
  final List<QandA> qna;

  const QnALoadedState({@required this.qna}) : assert(qna != null);

  @override
  List<Object> get props => qna;
}

class QnAErrorState extends QnAState {
  final String message;

  const QnAErrorState({@required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}
