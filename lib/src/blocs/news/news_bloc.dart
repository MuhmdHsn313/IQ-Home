import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:iqhome/src/models/news.dart';
import 'package:iqhome/src/repositories/news_repository.dart';
import './bloc.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;

  NewsBloc() : _newsRepository = new NewsRepository();

  @override
  NewsState get initialState => NewsLoading();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is FetchNews) yield* _fetchNewsToState();
    if (event is SeenNewNews) yield* _seenNewNewsToState(event);
    if (event is NewFetchedNews) {
      yield NewsSuccessfulLoading(event.news);
    }
    if (event is NewErrorHandle) {
      yield NewsLoadingError(event.error);
    }
  }

  Stream<NewsState> _fetchNewsToState() async* {
    try {
      _newsRepository.streamFetch().listen(
            (news) => add(
              NewFetchedNews(news),
            ),
            onError: (_) => add(NewErrorHandle(_)),
          );
    } catch (_) {
      yield NewsLoadingError(_);
    }
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
      yield NewsSuccessfulLoading(news);
    }
  }

  @override
  Future<void> close() {
    _newsRepository.dispose();
    return super.close();
  }
}
