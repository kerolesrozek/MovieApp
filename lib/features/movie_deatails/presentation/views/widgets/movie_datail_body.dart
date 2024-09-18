import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:moviesapp/features/movie_deatails/presentation/manager/get_movie_person_cubit/get_movie_person_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/movie_video_cubit/movie_video_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/similler_movies_cubit/similler_movies_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_data_session.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_video_builder.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/similler_movie_session.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class MovieDetailbody extends StatefulWidget {
  const MovieDetailbody({
    super.key,
    required this.movie,
  });
  final MoviesListEntity movie;
  @override
  State<MovieDetailbody> createState() => _MovieDetailbodyState();
}

class _MovieDetailbodyState extends State<MovieDetailbody> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MovieVideoCubit>(context).getMovieVideo(
      movieId: widget.movie.id!,
    );
    BlocProvider.of<SimillerMoviesCubit>(context)
        .getSimellerMovies(movieId: widget.movie.id!);
    BlocProvider.of<GetMoviePersonCubit>(context)
        .getMoviesPesron(movieId: widget.movie.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: MovieVideoBuilder(widget: widget)),
          MovieDataSession(movie: widget.movie),
          SimillerMovieSession(movie: widget.movie),

          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 10,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Text(
          //     widget.movie.name ?? 'movie name nullll',
          //     style: Styles.fontsize22,
          //   ),
          // ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 10,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 8.0),
          //     child: Text(
          //       widget.movie.overview ?? 'movie overview nullll',
          //       style: Styles.fontsize22.copyWith(color: Colors.grey.shade600),
          //       maxLines: 3,
          //       overflow: TextOverflow.ellipsis,
          //     ),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 15,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Row(
          //     children: [
          //       Text(
          //         'Popularity : ${widget.movie.poularity!.round()}',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w900,
          //         ),
          //       ),
          //       Spacer(),
          //       Icon(
          //         Icons.star,
          //         color: Colors.yellow,
          //         size: 30,
          //       ),
          //       Text(
          //         '${widget.movie.voteCountRate}',
          //         style: TextStyle(
          //           fontSize: 18,
          //           fontWeight: FontWeight.w900,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 10,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: MovieActorsListBuilder(),
          // ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 30,
          //   ),
          // ),
          // ,
          // SliverToBoxAdapter(
          //   child: Text(
          //     'Similar Movies',
          //     style: Styles.fontsize22.copyWith(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 10,
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: SimillerMoviesListBuilder(movie: widget.movie),
          // ),
        ],
      ),
    );
  }
}
