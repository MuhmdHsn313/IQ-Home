import 'package:equatable/equatable.dart';

abstract class QnAEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchQnAEvent extends QnAEvent {}
