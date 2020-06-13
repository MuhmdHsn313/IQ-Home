import 'package:equatable/equatable.dart';

import '../../models/news.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsLoading extends NewsState {}

class NewsSuccessfulLoading extends NewsState {
  final List<News> news;

  const NewsSuccessfulLoading(this.news);

  @override
  List<Object> get props => news;

  @override
  String toString() => "NewsSuccessfulLoading { news: ${news.length} }";
}

class NewsLoadingError extends NewsState {
  final dynamic error;

  const NewsLoadingError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => "NewsLoadingError { error: $error } ";
}
