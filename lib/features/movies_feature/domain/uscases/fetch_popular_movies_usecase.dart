import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/repos/movies_repo.dart';

class FetchPopularMoviesUsecase {
 final MoviesRepo moviesRepo;

  FetchPopularMoviesUsecase({required this.moviesRepo});

 Future<Either<Failure, List<MoviesListEntity>>>  call(){
    return moviesRepo.fetchPopularMovies();
  }
}