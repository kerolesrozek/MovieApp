import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/approutes.dart';
import 'package:moviesapp/core/setup_sevice_locator.dart';
import 'package:moviesapp/core/styles.dart';
import 'package:moviesapp/features/movies_feature/data/repos_impl/movies_repo_implementaion.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_current_movies_usecase.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_popular_movies_usecase.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_top_rated_movies_usecase.dart';
import 'package:moviesapp/features/movies_feature/domain/uscases/fetch_upcoming_movies_usecase.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/current_movies_cubit/current_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/top_rated_cubit/top_rated_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/managers/upcoming_movies/upcoming_movies_cubit.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/widgets/movies_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrentMoviesCubit(
            FetchCurrentMoviesUsecase(
                moviesRepo: getIt.get<MoviesRepoImplementaion>()),
          )..getCurrentlyMovies(),
        ),
        BlocProvider(
          create: (context) => PopularmoviesCubit(
            FetchPopularMoviesUsecase(
                moviesRepo: getIt.get<MoviesRepoImplementaion>()),
          )..getPopularMovies(),
        ),
        BlocProvider(
          create: (context) => TopRatedCubit(
            FetchTopRatedMoviesUsecase(
                moviesRepo: getIt.get<MoviesRepoImplementaion>()),
          )..getTopRatedMovies(),
        ),
        BlocProvider(
          create: (context) => UpcomingMoviesCubit(
            FetchUpComingMoviesUsecase(
                moviesRepo: getIt.get<MoviesRepoImplementaion>()),
          )..getUpComindMovies(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'Movie Time',
              style: Styles.fontsize22.copyWith(fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(RoutesApp.ksearchview,);
                  },
                  icon: const Icon(
                    Icons.search_sharp,
                    size: 30,
                  ))
            ],
          ),
          body: const MoviesViewBody(),
        ),
      ),
    );
  }
}
