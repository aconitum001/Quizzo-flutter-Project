part of 'question_cubit.dart';

sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionSuccess extends QuestionState {
  List<Question> questions;

  QuestionSuccess({required this.questions});
}
