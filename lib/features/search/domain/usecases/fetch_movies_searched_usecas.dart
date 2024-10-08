import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/search/domain/search_repos/search_repo.dart';

class FetchMoviesSearchedUsecas {

  final SearchRepo searchRepo;

  FetchMoviesSearchedUsecas({required this.searchRepo});
 Future<Either<Failure, List<MovieEntity>>> call({required String searchValue}){
    return searchRepo.fetchMoviesBySearch(searchValue: searchValue);
  }
}