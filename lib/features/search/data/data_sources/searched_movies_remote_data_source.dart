import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

abstract class SearchedMoviesRemoteDataSource {
Future<List<  MoviesListEntity>> getSearchedMovies({required String movieValue});
}



class SearchedMoviesRemoteDataSourceImple extends SearchedMoviesRemoteDataSource{
 
final ApiServices apiServices;

  SearchedMoviesRemoteDataSourceImple({required this.apiServices});
  @override
  Future<List< MoviesListEntity>> getSearchedMovies({required String movieValue}) async{
  Map<String,dynamic>jsonData=await apiServices.get(endpoin:'search/movie?query=$movieValue&');
  List<MoviesListEntity>searchedMovies=[];
  for (var element in jsonData["results"]) {
    searchedMovies.add(MoviesListEntity.fromJson(element)); 
    
  }
  return searchedMovies;

  }
}