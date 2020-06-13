import 'package:equatable/equatable.dart';

import '../../models/news.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {}

class NewFetchedNews extends NewsEvent {
  final List<News> news;

  const NewFetchedNews(this.news);

  @override
  List<Object> get props => news;

  @override
  String toString() => "NewFetchedNews { news: ${news.length} }";
}

class SeenNewNews extends NewsEvent {
  final News news;

  const SeenNewNews(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => "SeenNewNews: { news: ${news.title} }";
}

class NewErrorHandle extends NewsEvent {
  final dynamic error;

  const NewErrorHandle(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "NewErrorHandle { error: $error }";
}
