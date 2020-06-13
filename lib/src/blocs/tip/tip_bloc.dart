import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../models/tip.dart';
import '../../repositories/repositories.dart';

class TipBloc extends Bloc<TipEvent, TipState> {
  final TipRepository repository;

  TipBloc() : repository = new TipRepository();

  @override
  TipState get initialState => TipLoadingState();

  @override
  Stream<TipState> mapEventToState(TipEvent event) async* {
    if (event is FetchTipsEvent) {
      try {
        List<Tip> tips = await repository.fetch();
        yield TipLoadedState(tips: tips);
      } catch (e) {
        yield TipErrorState(message: e.toString());
      }
    }
  }
}
