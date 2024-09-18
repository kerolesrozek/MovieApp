import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/shimmer_loading_widget.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/upcoming_movies/upcoming_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/upcoming_movies_list.dart';

class UpcomingMoviesListBuilder extends StatelessWidget {
  const UpcomingMoviesListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingMoviesCubit, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesSuccess) {
  return UpComingMoviesList(movies:state.movies,);
}else if(state is UpcomingMoviesFailure){
  return Text(state.errorMessage);
}else{
  return const ShimmerLoading();
}
      },
    );
  }
}
