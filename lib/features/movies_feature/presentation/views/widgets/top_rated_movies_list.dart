
import 'package:flutter/material.dart';
import 'package:moviesapp/core/styles.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/custom_movie_image.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key, required this.movies});
final List<MoviesListEntity>movies;
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(bottom: 15.0),
       child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top Rated Movies',style: Styles.fontsize22,),
            const SizedBox(
              height: 4,
            ),
           SizedBox(
            height: MediaQuery.of(context).size.height * .30,
            child: ListView.builder(
              itemCount: movies.length,
            scrollDirection: Axis.horizontal,
              itemBuilder:(context,index)=> CustomMovieImage(
                movie: movies[index],
              )),
               ),
         ],
       ),
     );
  }
}
