import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviesapp/core/errors/failure_errors.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/search/data/data_sources/searched_movies_remote_data_source.dart';
import 'package:moviesapp/features/search/domain/search_repos/search_repo.dart';

class SearchRepoImple extends SearchRepo {
  final SearchedMoviesRemoteDataSource searchedMoviesRemoteDataSource;

  SearchRepoImple({required this.searchedMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieEntity>>> fetchMoviesBySearch(
      {required String searchValue}) async {
    try {
      List<MovieEntity> results = await searchedMoviesRemoteDataSource
          .getSearchedMovies(movieValue: searchValue);
      return right(results);
    } catch (e) {
      if (e is DioException) {
        return left(ApiServerEror.fromDioException(
          e,
        ));
      }
      return left(
        ApiServerEror(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
