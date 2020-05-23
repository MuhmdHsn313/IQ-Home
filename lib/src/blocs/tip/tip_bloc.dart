import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/repositories/repositories.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  final TipRepository repository;

  TipBloc() : repository = new TipRepository();

  @override
  TipState get initialState => TipLoadingState();

  @override
  Stream<TipState> mapEventToState(TipEvent event) async* {
    if (event is FetchTipsEvent) {
      try {
        List<Tip> tips = await repository.getTip();
        yield TipLoadedState(tips: tips);
      } catch (e) {
        yield TipErrorState(message: e.toString());
      }
    }
  }
}
