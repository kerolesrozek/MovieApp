part of 'popular_movies_cubit.dart';


sealed class PopularmoviesState {}

final class PopularMoviesInitial extends PopularmoviesState {}
final class PopularMoviesLoading extends PopularmoviesState {}
final class PopularMoviesSuccess extends PopularmoviesState {
  final List<MovieEntity>movies;

  PopularMoviesSuccess({required this.movies});
}
final class PopularMoviesFailure extends PopularmoviesState {
  final String errorMessage;

  PopularMoviesFailure({required this.errorMessage});
}
