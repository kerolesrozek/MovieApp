import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/setup_sevice_locator.dart';
import 'package:moviesapp/features/movie_deatails/data/repos_impl/movie_repos_imple.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_person_usecase.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_video_usecase.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_simeller_movies_usecase.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/get_movie_person_cubit/get_movie_person_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/movie_video_cubit/movie_video_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/similler_movies_cubit/similler_movies_cubit.dart';

import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_datail_body.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movie_entity.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SimillerMoviesCubit(
            FetchSimellerMoviesUsecase(
              movieDetailRepos: getIt.get<MovieDetailRepoImple>(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => MovieVideoCubit(FetchMovieVideoUsecase(
            movieDetailRepos: getIt.get<MovieDetailRepoImple>(),
          )),
        ),
        BlocProvider(
          create: (context) => GetMoviePersonCubit(
            FetchMoviePersonUsecase(
              movieDetailRepos: getIt.get<MovieDetailRepoImple>(),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
        ),
        body: MovieDetailbody(
          movie: GoRouterState.of(context).extra as MovieEntity,
        ),
      ),
    );
  }
}






