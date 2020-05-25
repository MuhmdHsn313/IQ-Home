import 'package:iqhome/src/models/qanda.dart';
import 'package:iqhome/src/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class QnABloc extends Bloc<QnAEvent, QnAState> {
  QandARepository repository;

  QnABloc({@required this.repository});

  @override
  QnAState get initialState => QnAInitialState();

  @override
  Stream<QnAState> mapEventToState(QnAEvent event) async* {
    if (event is FetchQnAEvent) {
      yield QnALoadingState();
      try {
        final List<QandA> qna = await repository.fetch();
        yield QnALoadedState(qna: qna);
      } catch (e) {
        yield QnAErrorState(message: e.toString());
      }
    }
  }
}
