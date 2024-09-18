import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure,List<MoviesListEntity>>>fetchMoviesBySearch({required String searchValue});
}