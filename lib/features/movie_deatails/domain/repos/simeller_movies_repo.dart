import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class SimellerMoviesRepo {

  Future<Either<Failure,List< MoviesListEntity>>>fetchSimellerMovies({required int movieId});
}