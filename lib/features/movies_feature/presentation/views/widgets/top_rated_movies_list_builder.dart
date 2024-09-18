import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/shimmer_loading_widget.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/top_rated_cubit/top_rated_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/top_rated_movies_list.dart';

class TopRatedMoviesListBuilder extends StatelessWidget {
  const TopRatedMoviesListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedCubit, TopRatedState>(
      builder: (context, state) {
        if (state is TopRatedMoviesSuccess) {
  return TopRatedMoviesList(movies: state.movies,);
}else if(state is TopRatedMoviesFailure){
  return Text(state.errorMessage);
}else{
  return const ShimmerLoading();
}
      },
    );
  }
}
