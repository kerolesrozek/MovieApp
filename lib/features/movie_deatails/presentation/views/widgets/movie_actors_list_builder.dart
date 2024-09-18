
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/get_movie_person_cubit/get_movie_person_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_actors_list.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_actors_loading.dart';


class MovieActorsListBuilder extends StatelessWidget {
  const MovieActorsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMoviePersonCubit, GetMoviePersonState>(
      builder: (context, state) {
        if (state is GetMoviePersonSuccess) {
          return MovieActorsList(
            persons: state.person,
          );
        } else if (state is GetMoviePersonFailure) {
          return Text(state.errorMessage);
        } else {
          return const MovieActorsLoading();
        }
      },
    );
  }
}
