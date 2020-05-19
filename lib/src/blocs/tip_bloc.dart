import 'package:iqhome/src/blocs/tip_event.dart';
import 'package:iqhome/src/blocs/tips_state.dart';
import 'package:iqhome/src/models/tip.dart';
import 'package:iqhome/src/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';


class ArticleBloc extends Bloc<TipEvent, TipState> {

  TipRepository repository;

  ArticleBloc({@required this.repository});

  @override
  // TODO: implement initialState
  TipState get initialState => TipInitialState();

  @override
  Stream<TipState> mapEventToState(TipEvent event) async* {
    if (event is FetchTipsEvent) {
      yield TipLoadingState();
      try {
        List<Tip> tips = await repository.getTip();
        yield TipLoadedState(tips: tips);
      } catch (e) {
        yield TipErrorState(message: e.toString());
      }
    }
  }

}