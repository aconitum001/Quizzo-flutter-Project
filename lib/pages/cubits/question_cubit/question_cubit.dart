import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/services/get_questions.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  Future<void> getData({
    required String type,
    required String difficulty,
    required String questionNumbers,
    required String catId,
  }) async {
    emit(QuestionLoading());
    try {
      List<Question> questions = [];
      questions = await GetQuestionsService().getQuestions(
        type: type,
        difficulty: difficulty,
        questionNumbers: questionNumbers,
        catId: catId,
      );
      emit(QuestionSuccess(
        questions: questions,
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  void onChange(Change<QuestionState> change) {
    super.onChange(change);
    print(change);
  }
}
