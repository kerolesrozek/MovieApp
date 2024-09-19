import 'package:flutter/material.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/custom_movie_image.dart';

class SimillerMoviesList extends StatelessWidget {
  const SimillerMoviesList({
    super.key,
    required this.movie, required this.movies,
  });

  final MovieEntity? movie;
 final List<MovieEntity>movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: ListView.builder(
        itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CustomMovieImage(
              movie: movies[index],
            );
          }),
    );
  }
}
