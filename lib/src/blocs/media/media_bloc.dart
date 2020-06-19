import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iqhome/src/repositories/media_repository.dart';
import './bloc.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final MediaRepository _repository;

  MediaBloc() : _repository = new MediaRepository();

  @override
  MediaState get initialState => InitialMediaState();

  @override
  Stream<MediaState> mapEventToState(
    MediaEvent event,
  ) async* {
    if (event is FetchMedias) {
      try {
        yield MediaSuccessfulLoaded(await _repository.fetch());
      } catch (_) {
        yield MediaHandleError();
      }
    }
  }
}
