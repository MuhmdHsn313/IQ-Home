import 'package:equatable/equatable.dart';
import 'package:iqhome/src/models/emergency.dart';

abstract class EmergencyState extends Equatable {
  const EmergencyState();

  @override
  List<Object> get props => [];
}

class LoadEmergencies extends EmergencyState {}

class EmergenciesLoaded extends EmergencyState {
  final List<Emergency> emergencies;

  const EmergenciesLoaded(this.emergencies);

  @override
  List<Object> get props => emergencies;

  @override
  String toString() =>
      "EmergenciesLoaded { emergencies: ${emergencies.length} }";
}

class EmergencyError extends EmergencyState {
  final dynamic error;

  const EmergencyError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "EmergencyError { error: $error }";
}
