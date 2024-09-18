import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_person_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_peson_repo.dart';

class MoviePersonRepoImple extends MoviePesonRepo {
  final MoviePersonRemoteDataSource moviePersonRemoteDataSource;

  MoviePersonRepoImple({required this.moviePersonRemoteDataSource});
  @override
  Future<Either<Failure, List<MoviePersonEntity>>> fetchMoviePerson(
      {required int movieId}) async {
    try {
      List<MoviePersonEntity> person =
          await moviePersonRemoteDataSource.getMoviePerson(
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
}
