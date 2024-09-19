import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/shimmer_loading_widget.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/similler_movies_cubit/similler_movies_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/similler_movies_list.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

class SimillerMoviesListBuilder extends StatelessWidget {
  const SimillerMoviesListBuilder({
    super.key,
    required this.movie,
  });

  final MovieEntity? movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimillerMoviesCubit, SimillerMoviesState>(
      builder: (context, state) {
        if (state is SimillerMoviesSuccess) {
  return SimillerMoviesList(
    movies: state.movies,
    movie: movie);
}else if(state is SimillerMoviesFailure){
  return Text(state.errorMessage);
}else{
  return const ShimmerLoading();
}
      },
    );
  }
}
