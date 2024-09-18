import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_simeller_movies_usecase.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

part 'similler_movies_state.dart';

class SimillerMoviesCubit extends Cubit<SimillerMoviesState> {
  SimillerMoviesCubit(this.fetchSimellerMoviesUsecase) : super(SimillerMoviesInitial());
 final FetchSimellerMoviesUsecase fetchSimellerMoviesUsecase;

  getSimellerMovies({required int movieId}) async {
    emit(SimillerMoviesLoading());

    var results = await fetchSimellerMoviesUsecase.call(movieId: movieId);
    results.fold((fail) {
      emit(
        SimillerMoviesFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(SimillerMoviesSuccess(movies: success));
    });
  }
}
