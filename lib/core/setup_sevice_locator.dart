import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_detail_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/data/repos_impl/movie_repos_imple.dart';
import 'package:moviesapp/features/movies_feature/data/data_sources/movies_remote_data_source.dart';
import 'package:moviesapp/features/movies_feature/data/repos_impl/movies_repo_implementaion.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MovieDetailRepoImple>(
    MovieDetailRepoImple(
      movieDetailRemoteDataSource: MovieDetailRemoteDataSourceImplementaion(
        apiServices: ApiServices(
          dio: Dio(),
        ),
      ),
    ),
  );
  getIt.registerSingleton<MoviesRepoImplementaion>(
    MoviesRepoImplementaion(
      moviesRemoteDataSource: MoviesRemoteDataSourceImplementation(
          apiServices: ApiServices(dio: Dio())),
    ),
  );
}
