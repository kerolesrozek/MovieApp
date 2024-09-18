import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/approutes.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class CustomMovieImage extends StatelessWidget {
  const CustomMovieImage({
    super.key,
    this.movie,
  });
  final MoviesListEntity? movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RoutesApp.kmoviesDetailvDiew,extra: movie);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .30,
              child: AspectRatio(
                aspectRatio: 1.4 / 1.9,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: ('https://image.tmdb.org/t/p/w500${movie?.image}'),
                ),
              ),
            )),
      ),
    );
  }
}
