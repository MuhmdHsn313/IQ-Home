import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iqhome/src/repositories/statics_repository.dart';
import './bloc.dart';

class StaticsBloc extends Bloc<StaticsEvent, StaticsState> {
  StaticsRepository _repository;

  StaticsBloc() : _repository = new StaticsRepository();

  @override
  StaticsState get initialState => LoadStatics();

  @override
  Stream<StaticsState> mapEventToState(
    StaticsEvent event,
  ) async* {
    if (event is FetchLocalStatics) {
      try {
        yield StaticsSuccessfulLoaded(
          localStatics: await _repository.fetchLocal(),
          internationalStatics: [],
        );
      } catch (_) {
        print(_);
        yield LoadStaticsField();
      }
    }
  }
}
