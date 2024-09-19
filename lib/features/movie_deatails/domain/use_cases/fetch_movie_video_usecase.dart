import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_video_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_detail_repos.dart';

class FetchMovieVideoUsecase {
 final MovieDetailRepos movieDetailRepos;

  FetchMovieVideoUsecase({required this.movieDetailRepos});
 Future<Either<Failure, MovieVideoEntity>> call({required int movieId}){
    return movieDetailRepos.getMovieVideo(movieId: movieId);
  }
}