import 'package:equatable/equatable.dart';

abstract class TipEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchTipsEvent extends TipEvent {}
