import 'package:flutter/material.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/custom_movie_image.dart';

class SearchMoviesList extends StatelessWidget {
  const SearchMoviesList({
    super.key,
    required this.movies,
  });
  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              children: [
                CustomMovieImage(
                  movie: movies[index],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .40,
                      child: Text(
                        movies[index].name ?? 'movie name',
                        style: const TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .40,
                        child: Text(
                          movies[index].overview ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey, fontSize: 18),
                        )),
                    Text(
                      'Popularity: ${movies[index].poularity}',
                      style: const TextStyle(color: Colors.amber, fontSize: 17),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}
