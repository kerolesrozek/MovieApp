import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/data/data_sources/movies_remote_data_source.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/repos/movies_repo.dart';

class MoviesRepoImplementaion extends MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;

  MoviesRepoImplementaion({required this.moviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MoviesListEntity>>> fetchCurrentlyMovies() async {
    try {
      List<MoviesListEntity> results =
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
  Future<Either<Failure, List<MoviesListEntity>>> fetchPopularMovies() async {
    try {
      List<MoviesListEntity> results =
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
  Future<Either<Failure, List<MoviesListEntity>>> fetchTopRatedMovies() async {
    try {
      List<MoviesListEntity> results =
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
  Future<Either<Failure, List<MoviesListEntity>>> fetchUPComingMovies() async {
    try {
      List<MoviesListEntity> results =
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
