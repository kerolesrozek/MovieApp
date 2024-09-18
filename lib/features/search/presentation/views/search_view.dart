import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/api_services/api_services.dart';
import 'package:moviesapp/features/search/data/data_sources/searched_movies_remote_data_source.dart';
import 'package:moviesapp/features/search/data/repos_imple/search_repo_imple.dart';
import 'package:moviesapp/features/search/domain/usecases/fetch_movies_searched_usecas.dart';
import 'package:moviesapp/features/search/presentation/manager/search_movies/search_movies_cubit.dart';

import 'package:moviesapp/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search For movie'),
      ),
      body: BlocProvider(
        create: (context) => SearchMoviesCubit(
          FetchMoviesSearchedUsecas(
            searchRepo: SearchRepoImple(
              searchedMoviesRemoteDataSource:
                  SearchedMoviesRemoteDataSourceImple(
                apiServices: ApiServices(
                  dio: Dio(),
                ),
              ),
            ),
          ),
        ),
        child: const SearchViewBody(),
      ),
    );
  }
}
