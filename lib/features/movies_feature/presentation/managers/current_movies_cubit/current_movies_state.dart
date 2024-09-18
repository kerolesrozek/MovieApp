part of 'current_movies_cubit.dart';


sealed class CurrentMoviesState {}

final class CurrentMoviesInitial extends CurrentMoviesState {}
final class CurrentMoviesLodaing extends CurrentMoviesState {}
final class CurrentMoviesSuccess extends CurrentMoviesState {
  final List<MoviesListEntity>movies;

  CurrentMoviesSuccess({required this.movies});
}
final class CurrentMoviesFailure extends CurrentMoviesState {
  final String errorMessage;

  CurrentMoviesFailure({required this.errorMessage});
}
