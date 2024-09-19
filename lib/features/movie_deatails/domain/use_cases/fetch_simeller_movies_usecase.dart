import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/movie_detail_repos.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

class FetchSimellerMoviesUsecase {
 final MovieDetailRepos movieDetailRepos;

  FetchSimellerMoviesUsecase({required this.movieDetailRepos});


 Future<Either<Failure,List< MovieEntity>>> call( {required int movieId}){
    return movieDetailRepos.fetchSimellerMovies(
      movieId: movieId
    );
  }
}