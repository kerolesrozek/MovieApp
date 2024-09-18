import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/core/api_services/bloc_observer.dart';
import 'package:moviesapp/core/approutes.dart';
import 'package:moviesapp/core/setup_sevice_locator.dart';

void main() {
  
  Bloc.observer = SimpleBlocObserver();
  setup();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: RoutesApp.router,
    );
  }
}
