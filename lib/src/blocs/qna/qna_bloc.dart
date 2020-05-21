import 'package:iqhome/src/blocs/tip_event.dart';
import 'package:iqhome/src/models/qanda.dart';
import 'package:iqhome/src/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'qna_event.dart';
import 'qna_state.dart';


class QnABloc extends Bloc<QnAEvent, QnAState> {

  QandARepository repository;

  QnABloc({@required this.repository});

  @override
  
  QnAState get initialState => QnAInitialState();

  @override
  Stream<QnAState> mapEventToState(QnAEvent event) async* {
    if (event is FetchTipsEvent) {
      yield QnALoadingState();
      try {
        List<QandA> qna = await repository.getqna();
        yield QnALoadedState(qna: qna);
      } catch (e) {
        yield QnAErrorState(message: e.toString());
      }
    }
  }

}