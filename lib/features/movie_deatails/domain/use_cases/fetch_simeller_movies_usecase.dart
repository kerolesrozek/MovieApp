import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movie_deatails/domain/repos/simeller_movies_repo.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class FetchSimellerMoviesUsecase {
 final SimellerMoviesRepo simellerMoviesRepo;

  FetchSimellerMoviesUsecase({required this.simellerMoviesRepo});

 Future<Either<Failure,List< MoviesListEntity>>> call( {required int movieId}){
    return simellerMoviesRepo.fetchSimellerMovies(
      movieId: movieId
    );
  }
}