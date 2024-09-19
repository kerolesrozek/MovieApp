
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/search/domain/usecases/fetch_movies_searched_usecas.dart';

part 'search_movies_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  SearchMoviesCubit(this.fetchMoviesSearchedUsecas)
      : super(SearchMoviesInitial());
  final FetchMoviesSearchedUsecas fetchMoviesSearchedUsecas;

  getSearchedMovies({required String searchValue}) async {
    emit(SearchMoviesLoading());

    var results =
        await fetchMoviesSearchedUsecas.call(searchValue: searchValue);
    results.fold((fail) {
      emit(
        SearchMoviesFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        SearchMoviesSuccess(
          movies: success,
        ),
      );
    });
  }
}
