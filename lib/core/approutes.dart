import 'package:go_router/go_router.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/movie_detail_view.dart';
import 'package:moviesapp/features/movies_feature/presentation/views/movies_view.dart';
import 'package:moviesapp/features/search/presentation/views/search_view.dart';
import 'package:moviesapp/features/splash/presentation/views/splash_view.dart';

class RoutesApp {
// GoRouter configuration
 static String kmoviesView='/movies_view';
 static String kmoviesDetailvDiew='/movie_detail_view';
 static String ksearchview='/search_view';
 static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>const SplashView(),
      ),
        GoRoute(
        path:kmoviesView ,
        builder: (context, state) => const MoviesView(),
      ),

       GoRoute(
        path:kmoviesDetailvDiew ,
        builder: (context, state) => const MovieDetailView(),
      ),
      GoRoute(
        path:ksearchview ,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
