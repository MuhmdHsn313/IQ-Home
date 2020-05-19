import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/tip.dart';
import 'package:meta/meta.dart';


abstract class TipState extends Equatable {}


class TipInitialState extends TipState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class TipLoadingState extends TipState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}



class TipLoadedState extends TipState {

  List<Tip> tips;

  TipLoadedState({@required this.tips});

  @override
  // TODO: implement props
  List<Object> get props => [tips];
}



class TipErrorState extends TipState {

  String message;

  TipErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}