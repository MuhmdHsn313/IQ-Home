import 'package:equatable/equatable.dart';

import '../../models/media.dart';

abstract class MediaState extends Equatable {
  const MediaState();

  @override
  List<Object> get props => [];
}

class InitialMediaState extends MediaState {}

class MediaSuccessfulLoaded extends MediaState {
  final List<Media> medias;

  const MediaSuccessfulLoaded(this.medias);

  @override
  List<Object> get props => medias;
}

class MediaHandleError extends MediaState {}
