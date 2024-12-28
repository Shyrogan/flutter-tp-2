import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool isCorrect;

  Question({required this.questionText, required this.isCorrect});
}

class ProviderQuestionnaireModel extends ChangeNotifier {
  final String? image;
  final List<Question> questions;
  late Question _current;

  ProviderQuestionnaireModel({required this.questions, this.image}) {
    _current = questions.first;
  }

  Question current() {
    return _current;
  }

  void next() {
    _current = questions[(questions.indexOf(_current) + 1) % questions.length];
    notifyListeners();
  }
}
