part of 'upcoming_movies_cubit.dart';


sealed class UpcomingMoviesState {}

final class UpcomingMoviesInitial extends UpcomingMoviesState {}
final class UpcomingMoviesLoading extends UpcomingMoviesState {}
final class UpcomingMoviesSuccess extends UpcomingMoviesState {
  final List<MovieEntity>movies;

  UpcomingMoviesSuccess({required this.movies});
}
final class UpcomingMoviesFailure extends UpcomingMoviesState {
  final String errorMessage;

  UpcomingMoviesFailure({required this.errorMessage});
}
