import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../repositories/concept_repository.dart';

class ConceptBloc extends Bloc<ConceptEvent, ConceptState> {
  final ConceptRepository _repository;

  ConceptBloc() : _repository = new ConceptRepository();

  @override
  ConceptState get initialState => InitialConceptState();

  @override
  Stream<ConceptState> mapEventToState(
    ConceptEvent event,
  ) async* {
    if (event is FetchConcepts) {
      try {
        yield ConceptSuccessfulLoaded(await _repository.fetch());
      } catch (_) {
        yield HandleConceptError();
      }
    }
  }
}
