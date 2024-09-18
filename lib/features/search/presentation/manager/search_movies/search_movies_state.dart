part of 'search_movies_cubit.dart';


sealed class SearchMoviesState {}

final class SearchMoviesInitial extends SearchMoviesState {}
final class SearchMoviesLoading extends SearchMoviesState {}
final class SearchMoviesSuccess extends SearchMoviesState {
  final List<MoviesListEntity>movies;

  SearchMoviesSuccess({required this.movies});
}
final class SearchMoviesFailure extends SearchMoviesState {
  final String errorMessage;

  SearchMoviesFailure({required this.errorMessage});
}
