import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';
import '../../repositories/statics_repository.dart';

class StaticsBloc extends Bloc<StaticsEvent, StaticsState> {
  StaticsRepository _repository;
  List global;

  StaticsBloc() : _repository = new StaticsRepository();

  @override
  StaticsState get initialState => LoadStatics();

  @override
  Stream<Transition<StaticsEvent, StaticsState>> transformEvents(
    Stream<StaticsEvent> events,
    Stream<Transition<StaticsEvent, StaticsState>> Function(
      StaticsEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap(transitionFn);
  }

  @override
  Stream<StaticsState> mapEventToState(
    StaticsEvent event,
  ) async* {
    if (event is FetchLocalStatics) {
      try {
        global = await _repository.fetchGlobal();
        yield StaticsSuccessfulLoaded(
          localStatics: await _repository.fetchLocal(),
          internationalStatics: global,
        );
      } catch (_) {
        print(_);
        yield LoadStaticsField();
      }
    }

    if (event is Search) {
      final cs = state;
      if (cs is StaticsSuccessfulLoaded) {
        if (event.str.isNotEmpty)
          yield cs.copyWith(
            internationalStatics: global
                .where(
                  (element) => element.name.toLowerCase().contains(event.str.toLowerCase()),
                )
                .toList(),
          );
        else
          yield cs.copyWith(
            internationalStatics: global,
          );
      }
    }
  }
}
