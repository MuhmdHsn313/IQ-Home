import 'package:equatable/equatable.dart';

import '../../models/area_statics.dart';

abstract class StaticsState extends Equatable {
  const StaticsState();

  @override
  List<Object> get props => [];
}

class LoadStatics extends StaticsState {}

class StaticsSuccessfulLoaded extends StaticsState {
  final List<AreaStatics> localStatics;
  final List<AreaStatics> internationalStatics;

  // final AreaCase chart;
  // final Map<String, int> localTotal;

  const StaticsSuccessfulLoaded({
    // this.chart,
    // this.localTotal,
    this.localStatics,
    this.internationalStatics,
  })  : assert(localStatics != null),
        assert(internationalStatics != null);

  StaticsSuccessfulLoaded copyWith({
    List<AreaStatics> localStatics,
    List<AreaStatics> internationalStatics,
  }) =>
      StaticsSuccessfulLoaded(
        localStatics: localStatics ?? this.localStatics,
        internationalStatics: internationalStatics ?? this.internationalStatics,
      );

  @override
  List<Object> get props =>
      []..addAll(localStatics)..addAll(internationalStatics);
}

class LoadStaticsField extends StaticsState {}
