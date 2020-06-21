import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import './bloc.dart';
import '../../models/news.dart';
import '../../repositories/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc() : _newsRepository = new NewsRepository();

  @override
  Stream<Transition<NewsEvent, NewsState>> transformEvents(
    Stream<NewsEvent> events,
    TransitionFunction<NewsEvent, NewsState> transition,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transition,
    );
  }

  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    final currentState = state;
    if (event is LoadMoreNews && !_hasReachedMax(currentState)) {
      if (await _newsRepository.connectionChecker.hasConnection) {
        try {
          if (currentState is NewsSuccessfulLoading) {
            final list =
                await _newsRepository.fetch(currentState.news.length, 5);
            if (list.isNotEmpty)
              yield currentState.copyWith(
                news: currentState.news + list,
              );
            else
              yield currentState.copyWith(
                hasReachedMax: true,
              );
          }
        } catch (_) {
          yield NewsLoadingError(_);
        }
      }
    }

    if (event is FetchNews) {
      try {
        yield NewsSuccessfulLoading(await _newsRepository.fetch(0, 50), false);
      } catch (_) {
        yield NewsLoadingError(_);
      }
    }
    if (event is SeenNewNews) yield* _seenNewNewsToState(event);
  }

  Stream<NewsState> _seenNewNewsToState(SeenNewNews event) async* {
    final currentState = state;
    if (currentState is NewsSuccessfulLoading) {
      final seenNews = event.news.copyWith(seen: true);
      await _newsRepository.updateSeen(seenNews);
      final List<News> news = currentState.news.map<News>(
        (newsEvent) {
          if (newsEvent.id == seenNews.id) return seenNews;
          return newsEvent;
        },
      ).toList();
      yield currentState.copyWith(
        news: news,
        hasReachedMax: currentState.hasReachedMax,
      );
    }
  }

  bool _hasReachedMax(NewsState state) =>
      state is NewsSuccessfulLoading && state.hasReachedMax;

  @override
  Future<void> close() {
    _newsRepository.dispose();
    return super.close();
  }
}
