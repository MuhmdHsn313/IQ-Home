import 'package:equatable/equatable.dart';

abstract class SourceEvent extends Equatable {
  const SourceEvent();

  @override
  List<Object> get props => [];
}

class FetchSources extends SourceEvent {}
