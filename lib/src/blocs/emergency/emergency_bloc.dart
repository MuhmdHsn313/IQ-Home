import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iqhome/src/repositories/emergency_repository.dart';
import './bloc.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  final EmergencyRepository _emergencyRepository;

  EmergencyBloc() : _emergencyRepository = new EmergencyRepository();

  @override
  EmergencyState get initialState => LoadEmergencies();

  @override
  Stream<EmergencyState> mapEventToState(
    EmergencyEvent event,
  ) async* {
    if (event is FetchEmergency) {
      try{
        yield EmergenciesLoaded(await _emergencyRepository.fetch());
      } catch(_){
        yield EmergencyError(_);
      }
    }
  }
}
