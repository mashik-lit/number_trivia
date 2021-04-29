import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/notifiers/number_state.dart';
import 'package:number_trivia/rest/repository.dart';

class NumberStateNotifier extends StateNotifier<NumberState> {
  final Repository _repository;

  NumberStateNotifier(ProviderReference reference)
      : _repository = Repository(),
        super(NumberInitial());

  void getTrivia(int number) async {
    state = TriviaLoading();

    try {
      final response = await _repository.getTriviaOf(number);
      state = TriviaLoaded(response);
    } catch (e) {
      state = TriviaLoadingFailed(e);
    }
  }
}
