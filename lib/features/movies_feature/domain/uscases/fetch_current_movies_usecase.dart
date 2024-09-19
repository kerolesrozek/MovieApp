import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/repos/movies_repo.dart';

class FetchCurrentMoviesUsecase {

 final MoviesRepo moviesRepo;

  FetchCurrentMoviesUsecase({required this.moviesRepo});
 Future<Either<Failure, List<MovieEntity>>> call(){
    return moviesRepo.fetchCurrentlyMovies();
  }
}