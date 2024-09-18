import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure,List<MoviesListEntity>>> fetchCurrentlyMovies();
  Future<Either<Failure,List<MoviesListEntity>>> fetchPopularMovies();
  Future<Either<Failure,List<MoviesListEntity>>> fetchTopRatedMovies();
  Future<Either<Failure,List<MoviesListEntity>>> fetchUPComingMovies();
}