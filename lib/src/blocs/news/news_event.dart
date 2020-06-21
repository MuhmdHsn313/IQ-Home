import 'package:equatable/equatable.dart';

import '../../models/news.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class FetchNews extends NewsEvent {}

class SeenNewNews extends NewsEvent {
  final News news;

  const SeenNewNews(this.news);

  @override
  List<Object> get props => [news];

  @override
  String toString() => "SeenNewNews: { news: ${news.title} }";
}

class LoadMoreNews extends NewsEvent {}

