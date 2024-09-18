import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_peson_repo.dart';

class FetchMoviePersonUsecase {
  final MoviePesonRepo moviePesonRepo;

  FetchMoviePersonUsecase({required this.moviePesonRepo});
  Future<Either<Failure, List<MoviePersonEntity>>> call(
      {required int movieId}) {
    return moviePesonRepo.fetchMoviePerson(movieId: movieId);
  }
}
