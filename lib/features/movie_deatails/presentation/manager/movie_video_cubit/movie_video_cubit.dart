
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_video_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_video_usecase.dart';

part 'movie_video_state.dart';

class MovieVideoCubit extends Cubit<MovieVideoState> {
  MovieVideoCubit(this.fetchMovieVideoUsecase) : super(MovieVideoInitial());

 final FetchMovieVideoUsecase fetchMovieVideoUsecase;
  getMovieVideo({required int movieId})async{
    emit(MovieVideoLoading(),);
var results=await fetchMovieVideoUsecase.call(movieId: movieId);
results.fold((fail){
  emit(MovieVideoFailure(errorMessage: fail.errorMessage,),);
}, (success){
  emit( MovieVideoSuccess(movieVideoEntity: success,),);
});
  }
}
