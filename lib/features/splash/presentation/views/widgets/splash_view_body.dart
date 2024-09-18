import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moviesapp/core/approutes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
   @override
     void initState() {
    
    super.initState();
    navigateToMoviewView();
  }

  void navigateToMoviewView() {
     Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      GoRouter.of(context).push(RoutesApp.kmoviesView);
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Movie Time...',
        style: TextStyle(fontSize: 30, fontFamily: 'Sectra Fine'),
      ),
    );
  }
}
