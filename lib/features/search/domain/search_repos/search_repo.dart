import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<MovieEntity>>>fetchMoviesBySearch({required String searchValue});
}