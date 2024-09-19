import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_detail_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_video_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_detail_repos.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

class MovieDetailRepoImple extends MovieDetailRepos {
  final MovieDetailRemoteDataSource movieDetailRemoteDataSource;

  MovieDetailRepoImple({required this.movieDetailRemoteDataSource});

 
  @override
  Future<Either<Failure, MovieVideoEntity>> getMovieVideo(
      {required int movieId}) async {
    try {
      MovieVideoEntity movieVideo =
          await movieDetailRemoteDataSource.getMovieVideo(movieId: movieId);
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

  @override
  Future<Either<Failure, List<MoviePersonEntity>>> fetchMoviePerson({required int movieId})async {
     try {
      List<MoviePersonEntity> person =
          await movieDetailRemoteDataSource.getMoviePerson(
        movieId: movieId,
      );
      return right(person);
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
  
  @override
 Future<Either<Failure, List<MovieEntity>>> fetchSimellerMovies(
      {required int movieId}) async {
    try {
      List<MovieEntity> similarMovies =
          await movieDetailRemoteDataSource.getSimellerMovies(
              movieId: movieId);
      return right(similarMovies);
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



