import 'package:equatable/equatable.dart';

abstract class ConceptEvent extends Equatable {
  const ConceptEvent();

  @override
  List<Object> get props => [];
}

class FetchConcepts extends ConceptEvent {}
