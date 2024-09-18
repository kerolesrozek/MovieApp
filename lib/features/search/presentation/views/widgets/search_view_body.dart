import 'package:flutter/material.dart';


import 'package:moviesapp/features/search/presentation/views/widgets/custom_text_feild.dart';
import 'package:moviesapp/features/search/presentation/views/widgets/search_movies_list_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomTextField(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SearchMoviesListBuilder(
         
        )
      ],
    );
  }
}
