import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());
  int questionSelectedIndex = 0;
  void increment() {
    questionSelectedIndex++;
  }
}
