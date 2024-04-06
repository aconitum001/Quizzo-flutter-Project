part of 'question_cubit.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionData extends QuestionState {}
