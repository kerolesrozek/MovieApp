import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/similler_movies_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/simeller_movies_repo.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class SimillerMoviesRepoImplementatio extends SimellerMoviesRepo {
  final SimillerMoviesRemoteDataSource simillerMoviesRemoteDataSource;

  SimillerMoviesRepoImplementatio(
      {required this.simillerMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MoviesListEntity>>> fetchSimellerMovies(
      {required int movieId}) async {
    try {
      List<MoviesListEntity> similarMovies =
          await simillerMoviesRemoteDataSource.getSimellerMovies(
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
