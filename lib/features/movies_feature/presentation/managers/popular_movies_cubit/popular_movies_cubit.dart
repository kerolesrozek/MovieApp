
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_popular_movies_usecase.dart';

part 'popular_movies_state.dart';

class PopularmoviesCubit extends Cubit<PopularmoviesState> {
  PopularmoviesCubit(this.fetchPopularMoviesUsecase)
      : super(PopularMoviesInitial());

  final FetchPopularMoviesUsecase fetchPopularMoviesUsecase;

  getPopularMovies() async {
    emit(
      PopularMoviesLoading(),
    );
    var results = await fetchPopularMoviesUsecase.call();
    results.fold(
      (fail) {
        emit(
          PopularMoviesFailure(
            errorMessage: fail.errorMessage,
          ),
        );
      },
      (success) {
        emit(
          PopularMoviesSuccess(
            movies: success,
          ),
        );
      },
    );
  }
}
