import 'package:equatable/equatable.dart';

abstract class NumberState extends Equatable {
  const NumberState();
}

class NumberInitial extends NumberState {
  const NumberInitial();

  @override
  List<Object> get props => [];
}

class TriviaLoading extends NumberState {
  const TriviaLoading();

  @override
  List<Object> get props => [];
}

class TriviaLoaded extends NumberState {
  final String trivia;

  const TriviaLoaded(this.trivia);

  @override
  List<Object> get props => [trivia];
}

class TriviaLoadingFailed extends NumberState {
  final error;

  const TriviaLoadingFailed(this.error);

  @override
  List<Object> get props => [error];
}
