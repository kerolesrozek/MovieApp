part of 'get_movie_person_cubit.dart';


sealed class GetMoviePersonState {}

final class GetMoviePersonInitial extends GetMoviePersonState {}
final class GetMoviePersonLoading extends GetMoviePersonState {}
final class GetMoviePersonSuccess extends GetMoviePersonState {
  final List<MoviePersonEntity>person;

  GetMoviePersonSuccess({required this.person});
}
final class GetMoviePersonFailure extends GetMoviePersonState {
  final String errorMessage;

  GetMoviePersonFailure({required this.errorMessage});
}
