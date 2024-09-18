import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_current_movies_usecase.dart';

part 'current_movies_state.dart';

class CurrentMoviesCubit extends Cubit<CurrentMoviesState> {
  CurrentMoviesCubit(this.fetchCurrentMoviesUsecase)
      : super(CurrentMoviesInitial());
  final FetchCurrentMoviesUsecase fetchCurrentMoviesUsecase;
  getCurrentlyMovies() async {
    emit(CurrentMoviesLodaing());
    var results = await fetchCurrentMoviesUsecase.call();
    results.fold((fail) {
      emit(CurrentMoviesFailure(errorMessage: fail.errorMessage));
    }, (success) {
      emit(CurrentMoviesSuccess(movies: success),);
  
    });
  }
}
