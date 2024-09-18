import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';

abstract  class MoviePesonRepo {
  Future<Either<Failure,List<MoviePersonEntity>>> fetchMoviePerson({required int movieId});
}