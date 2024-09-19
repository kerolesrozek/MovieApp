import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_detail_repos.dart';

class FetchMoviePersonUsecase {
  
final MovieDetailRepos movieDetailRepos;

  FetchMoviePersonUsecase({required this.movieDetailRepos});

  
  Future<Either<Failure, List<MoviePersonEntity>>> call(
      {required int movieId}) {
    return movieDetailRepos.fetchMoviePerson(movieId: movieId);
  }
}
