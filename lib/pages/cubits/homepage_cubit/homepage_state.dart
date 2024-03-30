part of 'homepage_cubit.dart';

sealed class HomepageState {}

final class HomepageInitial extends HomepageState {}

final class HomepageSuccess extends HomepageState {
  final DocumentSnapshot<Map<String, dynamic>> snapshot;
  HomepageSuccess({required this.snapshot});
}

final class HomepageLoading extends HomepageState {}

final class HomepageFailure extends HomepageState {}
