part of 'movie_video_cubit.dart';

sealed class MovieVideoState {}

final class MovieVideoInitial extends MovieVideoState {}
final class MovieVideoLoading extends MovieVideoState {}
final class MovieVideoSuccess extends MovieVideoState {
  final MovieVideoEntity movieVideoEntity;

  MovieVideoSuccess({required this.movieVideoEntity});
}
final class MovieVideoFailure extends MovieVideoState {
  final String errorMessage;

  MovieVideoFailure({required this.errorMessage});
}
