import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/business_logic/bloc/question.dart';
import 'package:tp2/data/models/question.dart';
import 'package:transparent_image/transparent_image.dart';

class QuestionBlocWidget extends StatelessWidget {
  const QuestionBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, Question>(
        builder: (context, state) => Scaffold(
            appBar: AppBar(title: const Text("Question aléatoire")),
            body: Center(
                child: Card(
                    margin: const EdgeInsets.all(16.0),
                    elevation: 4.0,
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  context.read<QuestionCubit>().image != null
                                      ? NetworkImage(
                                          context.read<QuestionCubit>().image!)
                                      : MemoryImage(kTransparentImage),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.questionText,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                child: const Text("Vrai"),
                                onPressed: () => {
                                      if (state.isCorrect)
                                        context.read<QuestionCubit>().next()
                                    }),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                child: const Text("Faux"),
                                onPressed: () => {
                                      if (!state.isCorrect)
                                        context.read<QuestionCubit>().next()
                                    })
                          ],
                        ))))));
  }
}
