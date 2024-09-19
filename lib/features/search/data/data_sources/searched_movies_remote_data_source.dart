import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

abstract class SearchedMoviesRemoteDataSource {
Future<List<  MovieEntity>> getSearchedMovies({required String movieValue});
}



class SearchedMoviesRemoteDataSourceImple extends SearchedMoviesRemoteDataSource{
 
final ApiServices apiServices;

  SearchedMoviesRemoteDataSourceImple({required this.apiServices});
  @override
  Future<List< MovieEntity>> getSearchedMovies({required String movieValue}) async{
  Map<String,dynamic>jsonData=await apiServices.get(endpoin:'search/movie?query=$movieValue&');
  List<MovieEntity>searchedMovies=[];
  for (var element in jsonData["results"]) {
    searchedMovies.add(MovieEntity.fromJson(element)); 
    
  }
  return searchedMovies;

  }
}