import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/data/models/question.dart';
import 'package:transparent_image/transparent_image.dart';

class ProviderQuestionnaireWidget extends StatelessWidget {
  const ProviderQuestionnaireWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderQuestionnaireModel>(
        builder: (context, model, child) => Scaffold(
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
                              backgroundImage: model.image != null
                                  ? NetworkImage(model.image!)
                                  : MemoryImage(kTransparentImage),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              model.current().questionText,
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
                                      if (model.current().isCorrect)
                                        model.next()
                                    }),
                            const SizedBox(height: 16),
                            ElevatedButton(
                                child: const Text("Faux"),
                                onPressed: () => {
                                      if (!model.current().isCorrect)
                                        model.next()
                                    })
                          ],
                        ))))));
  }
}
