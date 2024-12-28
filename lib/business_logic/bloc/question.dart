import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp2/data/models/question.dart';

class QuestionCubit extends Cubit<Question> {
  final String? image;
  final List<Question> questions;

  QuestionCubit({this.image, required this.questions}) : super(questions.first);

  void next() =>
      emit(questions[(questions.indexOf(state) + 1) % questions.length]);
}
