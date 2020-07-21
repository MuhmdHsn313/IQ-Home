import 'package:bloc/bloc.dart';

import './bloc.dart';
import '../../models/qanda.dart';
import '../../repositories/qna_repository.dart';

class QnABloc extends Bloc<QnAEvent, QnAState> {
  QandARepository _qandARepository;

  QnABloc() : _qandARepository = new QandARepository();

  @override
  QnAState get initialState => QnALoadingState();

  @override
  Stream<QnAState> mapEventToState(QnAEvent event) async* {
    if (event is FetchQnAEvent) {
      try {
        final List<QandA> qna = await _qandARepository.fetch();
        yield QnALoadedState(qna: qna);
      } catch (e) {
        yield QnAErrorState(message: e.toString());
      }
    }
  }
}
