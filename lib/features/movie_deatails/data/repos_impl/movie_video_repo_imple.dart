import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_video_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_video_repo.dart';

class MovieVideoRepoImple extends MovieVideoRepo {
  final MovieVideoRemoteDataSource movieVideoRemoteDataSource;

  MovieVideoRepoImple({required this.movieVideoRemoteDataSource});

 
  @override
  Future<Either<Failure, MovieVideoEntity>> getMovieVideo(
      {required int movieId}) async {
    try {
      MovieVideoEntity movieVideo =
          await movieVideoRemoteDataSource.getMovieVideo(movieId: movieId);
      return right(movieVideo);
    } catch (e) {
     
      if (e is DioException) {
        return left(
          ApiServerEror.fromDioException(
            e,
          ),
        );
      }
      return left(
        ApiServerEror(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
