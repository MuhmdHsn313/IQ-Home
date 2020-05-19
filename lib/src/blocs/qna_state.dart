import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/qanda.dart';
import 'package:meta/meta.dart';


abstract class QnAState extends Equatable {}


class QnAInitialState extends QnAState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class QnALoadingState extends QnAState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class QnALoadedState extends QnAState {

  List<QandA> qna;

  QnALoadedState({@required this.qna});

  @override
  // TODO: implement props
  List<Object> get props => [qna];
}



class QnAErrorState extends QnAState {

  String message;

  QnAErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}