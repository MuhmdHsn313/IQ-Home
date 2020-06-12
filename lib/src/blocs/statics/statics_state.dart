import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/area_statics.dart';

abstract class StaticsState extends Equatable {
  const StaticsState();

  @override
  List<Object> get props => [];
}

class LoadStatics extends StaticsState {}

class StaticsSuccessfulLoaded extends StaticsState {
  final List<AreaStatics> localStatics;
  final List<AreaStatics> internationalStatics;

  const StaticsSuccessfulLoaded({
    this.localStatics,
    this.internationalStatics,
  })  : assert(localStatics != null),
        assert(internationalStatics != null);

  @override
  List<Object> get props => localStatics..addAll(internationalStatics);
}

class LoadStaticsField extends StaticsState {}
