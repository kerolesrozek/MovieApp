import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieEntity>> getCurrentlyMovies();
  Future<List<MovieEntity>> getPopularMovies();
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getUpComindMovies();
}

class MoviesRemoteDataSourceImplementation extends MoviesRemoteDataSource {
  final ApiServices apiServices;

  MoviesRemoteDataSourceImplementation({required this.apiServices});
  @override
  Future<List<MovieEntity>> getCurrentlyMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/now_playing?');
    List<MovieEntity> currentMovies = [];
    for (var element in jsonData["results"]) {
      currentMovies.add(
        MovieEntity.fromJson(element),
      );
    }
    return currentMovies;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    Map<String, dynamic> jsonData = await apiServices.get(endpoin: 'movie/popular?');
    List<MovieEntity> popularMovies = [];
    for (var element in jsonData["results"]) {
      popularMovies.add(
        MovieEntity.fromJson(element),
      );
    }
    return popularMovies;
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/top_rated?');
    List<MovieEntity> topRatedMovies = [];
    for (var element in jsonData["results"]) {
      topRatedMovies.add(
        MovieEntity.fromJson(element),
      );
    }
    return topRatedMovies;
  }

  @override
  Future<List<MovieEntity>> getUpComindMovies() async {
    Map<String, dynamic> jsonData =
        await apiServices.get(endpoin: 'movie/upcoming?');
    List<MovieEntity> upcomingMovies = [];
    for (var element in jsonData["results"]) {
      upcomingMovies.add(
        MovieEntity.fromJson(element),
      );
    }
    return upcomingMovies;
  }
}
