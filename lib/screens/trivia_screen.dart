import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_trivia/notifiers/number_state.dart';
import 'package:number_trivia/notifiers/number_state_notifier.dart';

final numberStateNotifierProvider =
    StateNotifierProvider<NumberStateNotifier, NumberState>(
        (ref) => NumberStateNotifier(ref));

class TriviaScreen extends StatelessWidget {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers Trivia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Consumer(builder: (context, watch, child) {
                final state = watch(numberStateNotifierProvider);

                if (state is TriviaLoading) {
                  return CircularProgressIndicator();
                } else if (state is TriviaLoaded) {
                  return Text(
                    state.trivia,
                    style: Theme.of(context).textTheme.headline5,
                  );
                } else if (state is TriviaLoadingFailed) {
                  return Text(
                    'Error',
                    style: Theme.of(context).textTheme.headline5,
                  );
                } else {
                  return Text(
                    'Enter A Number',
                    style: Theme.of(context).textTheme.headline5,
                  );
                }
              }),
            ),
            SizedBox(height: 50.0),
            SizedBox(
              width: 80.0,
              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
                onPressed: () => context
                    .read(numberStateNotifierProvider.notifier)
                    .getTrivia(
                      int.parse(
                        textEditingController.text.toString(),
                      ),
                    ),
                child: Text('Get Trivia'))
          ],
        ),
      ),
    );
  }
}
