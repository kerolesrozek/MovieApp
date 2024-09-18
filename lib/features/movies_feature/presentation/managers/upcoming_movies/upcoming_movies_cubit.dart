
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_upcoming_movies_usecase.dart';

part 'upcoming_movies_state.dart';

class UpcomingMoviesCubit extends Cubit<UpcomingMoviesState> {
  UpcomingMoviesCubit(this.fetchUpComingMoviesUsecase) : super(UpcomingMoviesInitial());
final FetchUpComingMoviesUsecase fetchUpComingMoviesUsecase;

getUpComindMovies()async{
  emit(UpcomingMoviesLoading());
  var results=await fetchUpComingMoviesUsecase.call();
  results.fold((fail){
    emit(UpcomingMoviesFailure(errorMessage: fail.errorMessage),);
  }, (success){
    emit(UpcomingMoviesSuccess(movies: success,),);
  });
}
}
