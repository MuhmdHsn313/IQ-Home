import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iqhome/src/repositories/source_repository.dart';
import 'bloc.dart';

class SourceBloc extends Bloc<SourceEvent, SourceState> {
  final SourceRepository _sourceRepository;

  SourceBloc() : _sourceRepository = SourceRepository();

  @override
  SourceState get initialState => LoadingSource();

  @override
  Stream<SourceState> mapEventToState(
    SourceEvent event,
  ) async* {
    if (event is FetchSources) {
      try {
        yield SourceSuccessfulLoaded(await _sourceRepository.fetch());
      } catch (_) {
        yield SourceLoadError(_);
      }
    }
  }
}
