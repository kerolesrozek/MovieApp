
import 'package:flutter/material.dart';
import 'package:moviesapp/core/styles.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/similler_movies_list_builder.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class SimillerMovieSession extends StatelessWidget {
  const SimillerMovieSession({super.key, required this.movie});
  final MoviesListEntity movie;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
            Text(
              'Similar Movies',
              style: Styles.fontsize22.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          SimillerMoviesListBuilder(movie: movie),

        ],
      ),
    );
  }
}
