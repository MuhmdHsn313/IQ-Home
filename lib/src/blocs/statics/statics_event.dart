import 'package:equatable/equatable.dart';

abstract class StaticsEvent extends Equatable {
  const StaticsEvent();

  @override
  List<Object> get props => [];
}

class FetchLocalStatics extends StaticsEvent {}
class Search extends StaticsEvent {
  final String str;

  const Search(this.str);

  @override
  List<Object> get props => [str];

  @override
  String toString() => "Search: $str";
}
