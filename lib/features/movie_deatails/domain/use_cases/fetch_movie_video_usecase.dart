import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_video_repo.dart';

class FetchMovieVideoUsecase {
 final MovieVideoRepo movieVideoRepo;

  FetchMovieVideoUsecase({required this.movieVideoRepo});
 Future<Either<Failure, MovieVideoEntity>> call({required int movieId}){
    return movieVideoRepo.getMovieVideo(movieId: movieId);
  }
}