import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/core/setup_sevice_locator.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_person_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/movie_video_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/data/data_sources/similler_movies_remote_data_source.dart';
import 'package:moviesapp/features/movie_deatails/data/repos_impl/movie_person_repo_imple.dart';
import 'package:moviesapp/features/movie_deatails/data/repos_impl/movie_video_repo_imple.dart';
import 'package:moviesapp/features/movie_deatails/data/repos_impl/similler_movies_repo_implementatio.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_person_usecase.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_movie_video_usecase.dart';
import 'package:moviesapp/features/movie_deatails/domain/use_cases/fetch_simeller_movies_usecase.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/get_movie_person_cubit/get_movie_person_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/movie_video_cubit/movie_video_cubit.dart';
import 'package:moviesapp/features/movie_deatails/presentation/manager/similler_movies_cubit/similler_movies_cubit.dart';

import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/movie_datail_body.dart';
import 'package:moviesapp/features/movies_feature/domain/entities/movies_list_entity.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SimillerMoviesCubit(
            FetchSimellerMoviesUsecase(
              simellerMoviesRepo: SimillerMoviesRepoImplementatio(
                simillerMoviesRemoteDataSource:
                    SimillerMoviesRemoteDataSourceImplementaion(
                        apiServices: getIt.get<ApiServices>()),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => MovieVideoCubit(
            FetchMovieVideoUsecase(
              movieVideoRepo: MovieVideoRepoImple(
                movieVideoRemoteDataSource:
                    MovieVideoRemoteDataSourceImplementaion(
                        apiServices: getIt.get<ApiServices>()),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => GetMoviePersonCubit(
            FetchMoviePersonUsecase(
              moviePesonRepo: MoviePersonRepoImple(
                moviePersonRemoteDataSource: MoviePersonRemoteDataSourceImple(
                  apiServices: getIt.get<ApiServices>(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
        ),
        body: MovieDetailbody(
          movie: GoRouterState.of(context).extra as MoviesListEntity,
        ),
      ),
    );
  }
}










//         DefaultTabController(
//           length: 2,
//           child: TabBar(
//             tabs: [
//               Icon(Icons.abc),
//               Icon(Icons.access_alarm_rounded),

//             ],
//           ),
//         ),

// const TabBarView(
//   children: [
//     Icon(Icons.directions_car),
//     Icon(Icons.directions_transit),
//     Icon(Icons.directions_bike),
//   ],
// ),
        // TabBarView(
        //   children: [
        //     Expanded(
        //       child: GridView.builder(
        //         itemBuilder: (context, index) => CustomMovieImage(),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: GridView.builder(
        //         itemBuilder: (context, index) => CustomMovieImage(),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: GridView.builder(
        //         itemBuilder: (context, index) => CustomMovieImage(),
        //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //         ),
        //       ),
        //     ),

        //   ],
        // )