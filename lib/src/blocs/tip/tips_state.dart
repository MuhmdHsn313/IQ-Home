import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/tip.dart';
import 'package:meta/meta.dart';

abstract class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

class TipInitialState extends TipState {}

class TipLoadingState extends TipState {}

class TipLoadedState extends TipState {
  final List<Tip> tips;

  const TipLoadedState({@required this.tips}) : assert(tips != null);

  @override
  List<Object> get props => tips;
}

class TipErrorState extends TipState {
  final String message;

  const TipErrorState({@required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}
