import 'package:equatable/equatable.dart';

import '../../models/concept.dart';

abstract class ConceptState extends Equatable {
  const ConceptState();

  @override
  List<Object> get props => [];
}

class InitialConceptState extends ConceptState {}

class ConceptSuccessfulLoaded extends ConceptState {
  final List<Concept> concepts;

  const ConceptSuccessfulLoaded(this.concepts);

  @override
  List<Object> get props => concepts;
}

class HandleConceptError extends ConceptState {}
