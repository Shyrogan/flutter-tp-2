import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tp2/bloc.dart';
import 'package:tp2/provider.dart';
import 'package:tp2/question.dart';
import 'package:tp2/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Home(),
        '/quizz/providers': (context) => ChangeNotifierProvider(
          create: (context) => ProviderQuestionnaireModel(questions: [
            Question(questionText: "Lorsqu'on utilise ChangeNotifier avec Provider, est-il nécessaire d'appeler notifyListeners() après chaque modification d'état?",
              isCorrect: true
            ),
            Question(questionText: "Un Consumer peut-il écouter plusieurs Providers simultanément?",
              isCorrect: false
            ),
            Question(questionText: "Le widget Provider.of<T>(context) déclenche-t-il automatiquement une reconstruction quand les données changent?",
              isCorrect: false
            ),
            Question(questionText: "ChangeNotifierProvider est-il le seul type de Provider disponible dans le package provider?",
              isCorrect: false
            ),
            Question(questionText: "Est-il possible d'utiliser Provider pour gérer l'état global de l'application sans utiliser InheritedWidget directement?",
              isCorrect: true
            ),
          ]),
          child: const ProviderQuestionnaireWidget()
        ),
        '/quizz/bloc': (context) => BlocProvider(
          create: (_) => QuestionCubit(questions: [
            Question(
              questionText: "Un Bloc doit-il toujours avoir un état initial défini dans son constructeur?",
              isCorrect: true
            ),
            Question(
              questionText: "Les événements dans BLoC peuvent-ils être modifiés après leur émission?",
              isCorrect: false
            ),
            Question(
              questionText: "Est-il possible d'avoir plusieurs Blocs qui écoutent le même événement?",
              isCorrect: true
            ),
            Question(
              questionText: "Le BlocBuilder se reconstruit-il automatiquement à chaque émission d'état?",
              isCorrect: true
            ),
            Question(
              questionText: "Dans un Bloc, peut-on émettre plusieurs états dans un seul événement?",
              isCorrect: true
            ),
          ]),
          child: const QuestionBloc(),
        ),
        '/weather': (context) => const WeatherWidget()
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Text("Bienvenue, que souhaitez-vous faire?"),
          ElevatedButton(
            child: const Text("Questionnaire sur les Providers"),
            onPressed: () => Navigator.of(context).pushNamed("/quizz/providers"),
          ),
          ElevatedButton(
            child: const Text("Questionnaire sur les Blocs"),
            onPressed: () => Navigator.of(context).pushNamed("/quizz/bloc"),
          ),
          ElevatedButton(
            child: const Text("Questionnaire sur les Blocs"),
            onPressed: () => Navigator.of(context).pushNamed("/weather"),
          )
        ]),
      )
    );
  }
}
