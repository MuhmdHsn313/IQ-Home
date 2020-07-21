import 'package:equatable/equatable.dart';

import '../../models/source.dart';

abstract class SourceState extends Equatable {
  const SourceState();

  @override
  List<Object> get props => [];
}

class LoadingSource extends SourceState {}

class SourceSuccessfulLoaded extends SourceState {
  final List<Source> sources;

  const SourceSuccessfulLoaded(this.sources);

  @override
  List<Object> get props => sources;

  @override
  String toString() => "SourceSuccessfulLoaded { sources: ${sources.length} }";
}

class SourceLoadError extends SourceState {
  final dynamic error;

  const SourceLoadError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "SourceLoadError { error: $error }";
}
