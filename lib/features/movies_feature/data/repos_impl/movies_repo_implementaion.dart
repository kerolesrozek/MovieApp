import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/data/data_sources/movies_remote_data_source.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/repos/movies_repo.dart';

class MoviesRepoImplementaion extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImplementaion({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchCurrentlyMovies() async {
    try {
      List<MovieEntity> results =
          await moviesRemoteDataSource.getCurrentlyMovies();
      return right(results);
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
  Future<Either<Failure, List<MovieEntity>>> fetchPopularMovies() async {
    try {
      List<MovieEntity> results =
          await moviesRemoteDataSource.getPopularMovies();
      return right(results);
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
  Future<Either<Failure, List<MovieEntity>>> fetchTopRatedMovies() async {
    try {
      List<MovieEntity> results =
          await moviesRemoteDataSource.getTopRatedMovies();
      return right(results);
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
  Future<Either<Failure, List<MovieEntity>>> fetchUPComingMovies() async {
    try {
      List<MovieEntity> results =
          await moviesRemoteDataSource.getUpComindMovies();
      return right(results);
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
