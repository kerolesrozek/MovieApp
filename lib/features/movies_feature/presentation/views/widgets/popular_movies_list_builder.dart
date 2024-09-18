
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/shimmer_loading_widget.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/popular_movies_list.dart';

class PopularMoviesListBuilder extends StatelessWidget {
  const PopularMoviesListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularmoviesCubit, PopularmoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesSuccess) {
  return PopularMoviesList(movies: state.movies,);
}else if(state is PopularMoviesFailure){
  return Text(state.errorMessage);
}else{
  return const ShimmerLoading();
}
      },
    );
  }
}
