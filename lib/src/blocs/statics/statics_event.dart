import 'package:equatable/equatable.dart';

abstract class StaticsEvent extends Equatable {
  const StaticsEvent();

  @override
  List<Object> get props => [];
}

class FetchLocalStatics extends StaticsEvent {}
