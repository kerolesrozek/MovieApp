import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/movie_video_cubit/movie_video_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_datail_body.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_video_widget.dart';

class MovieVideoBuilder extends StatelessWidget {
  const MovieVideoBuilder({
    super.key,
    required this.widget,
  });

  final MovieDetailbody widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieVideoCubit, MovieVideoState>(
      builder: (context, state) {
        if (state is MovieVideoSuccess) {
          return MovieVideo(
            movieVideoEntity: state.movieVideoEntity,
            movieId: widget.movie.id!,
          );
        } else if (state is MovieVideoFailure) {
          return Text(state.errorMessage);
        } else {
          return const AspectRatio(
            aspectRatio: 16 / 9,
            child: SizedBox(),
          );
        }
      },
    );
  }
}
