
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_top_rated_movies_usecase.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.fetchTopRatedMoviesUsecase) : super(TopRatedInitial());
  final FetchTopRatedMoviesUsecase fetchTopRatedMoviesUsecase;

  getTopRatedMovies() async {
    emit(TopRatedLoading());
    var results = await fetchTopRatedMoviesUsecase.call();
    results.fold((fail) {
      emit(
        TopRatedMoviesFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        TopRatedMoviesSuccess(
          movies: success,
        ),
      );
    });
  }
}
