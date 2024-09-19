
import 'package:flutter/material.dart';
import 'package:moviesapp/core/styles.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_actors_list_builder.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

class MovieDataSession extends StatelessWidget {
  const MovieDataSession({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Text(
            movie.name ?? 'movie name nullll',
            style: Styles.fontsize22,
          ),
       const   SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              movie.overview ?? 'movie overview nullll',
              style: Styles.fontsize22.copyWith(color: Colors.grey.shade600),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        const  SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Popularity : ${movie.poularity!.round()}',
                style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
             const Spacer(),
              
              Text(
                'Rate : ${movie.voteCountRate}',
                style:const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
          const    Padding(
                padding: EdgeInsets.only(bottom: 4.0,left: 4),
                child: Icon(
                  Icons.star_rate,
                  color: Colors.yellow,
                  size: 25,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const MovieActorsListBuilder(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
