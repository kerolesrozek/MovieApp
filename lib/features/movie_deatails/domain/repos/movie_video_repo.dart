import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_entity.dart';

abstract class MovieVideoRepo {
  Future<Either<Failure,MovieVideoEntity>>getMovieVideo({required int movieId});
}