import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_video_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class MovieDetailRepos {
  Future<Either<Failure,MovieVideoEntity>>getMovieVideo({required int movieId});
    Future<Either<Failure,List<MoviePersonEntity>>> fetchMoviePerson({required int movieId});
  Future<Either<Failure,List< MovieEntity>>>fetchSimellerMovies({required int movieId});

}