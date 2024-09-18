

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/shimmer_loading_widget.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/current_movies_cubit/current_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/now_player_movies_list.dart';

class NowPlayerMoviesListBuilder extends StatelessWidget {
  const NowPlayerMoviesListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentMoviesCubit, CurrentMoviesState>(
      builder: (context, state) {
        if (state is CurrentMoviesSuccess) {
  return NowPlayerMoviesList(movies: state.movies,);
}else if(state is CurrentMoviesFailure){
  return Text(state.errorMessage);
}else{
  return const ShimmerLoading();
}
      },
    );
  }
}
