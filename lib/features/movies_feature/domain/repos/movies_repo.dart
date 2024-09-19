import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class MoviesRepo {
  Future<Either<Failure,List<MovieEntity>>> fetchCurrentlyMovies();
  Future<Either<Failure,List<MovieEntity>>> fetchPopularMovies();
  Future<Either<Failure,List<MovieEntity>>> fetchTopRatedMovies();
  Future<Either<Failure,List<MovieEntity>>> fetchUPComingMovies();
}