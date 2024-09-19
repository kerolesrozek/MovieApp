part of 'top_rated_cubit.dart';


sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedMoviesSuccess extends TopRatedState {
  final List<MovieEntity> movies;

  TopRatedMoviesSuccess({required this.movies});
}

final class TopRatedMoviesFailure extends TopRatedState {
  final String errorMessage;

  TopRatedMoviesFailure({required this.errorMessage});
}
