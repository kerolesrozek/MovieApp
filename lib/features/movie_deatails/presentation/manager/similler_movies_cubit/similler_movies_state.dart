part of 'similler_movies_cubit.dart';


sealed class SimillerMoviesState {}

final class SimillerMoviesInitial extends SimillerMoviesState {}
final class SimillerMoviesLoading extends SimillerMoviesState {}
final class SimillerMoviesSuccess extends SimillerMoviesState {
   final List<MovieEntity>movies;

  SimillerMoviesSuccess({required this.movies});
}
final class SimillerMoviesFailure extends SimillerMoviesState {
  final String errorMessage;

  SimillerMoviesFailure({required this.errorMessage});
}
