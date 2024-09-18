
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_person_usecase.dart';

part 'get_movie_person_state.dart';

class GetMoviePersonCubit extends Cubit<GetMoviePersonState> {
  GetMoviePersonCubit(this.fetchMoviePersonUsecase)
      : super(GetMoviePersonInitial());
  final FetchMoviePersonUsecase fetchMoviePersonUsecase;

  getMoviesPesron({required int movieId}) async {
    emit(
      GetMoviePersonLoading(),
    );
    var results = await fetchMoviePersonUsecase.call(movieId: movieId);
    results.fold((fail) {
      emit(
        GetMoviePersonFailure(
          errorMessage: fail.errorMessage,
        ),
      );
    }, (success) {
      emit(
        GetMoviePersonSuccess(
          person: success,
        ),
      );
    });
  }
}
