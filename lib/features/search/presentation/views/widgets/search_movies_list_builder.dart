import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/search/presentation/manager/search_movies/search_movies_cubit.dart';
import 'package:moviesapp/features/search/presentation/views/widgets/search_loading.dart';
import 'package:moviesapp/features/search/presentation/views/widgets/search_movies_list.dart';

class SearchMoviesListBuilder extends StatelessWidget {
  const SearchMoviesListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      builder: (context, state) {
        if (state is SearchMoviesSuccess) {
          return SearchMoviesList(
            movies: state.movies,
          );
        } else if (state is SearchMoviesFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errorMessage),
          );
        } else if (state is SearchMoviesInitial) {
          return const SliverToBoxAdapter(
            child: SizedBox(),
          );
        } else {
          return const SliverFillRemaining(
            child: ShimmerLoadingvertical(),
          );
        }
      },
    );
  }
}
