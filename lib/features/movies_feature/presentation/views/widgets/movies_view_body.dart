import 'package:flutter/material.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/now_player_movies_builder.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/popular_movies_list_builder.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/top_rated_movies_list_builder.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/upcoming_movies_list_builder.dart';

class MoviesViewBody extends StatelessWidget {
  const MoviesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
        SliverToBoxAdapter(child: NowPlayerMoviesListBuilder()),
        SliverToBoxAdapter(child: PopularMoviesListBuilder()),
        SliverToBoxAdapter(child: TopRatedMoviesListBuilder()),
        SliverToBoxAdapter(child: UpcomingMoviesListBuilder()),
      ]),
    );
  }
}
