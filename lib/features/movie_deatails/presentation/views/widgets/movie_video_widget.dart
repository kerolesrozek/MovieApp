import 'package:flutter/material.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieVideo extends StatefulWidget {
  const MovieVideo({super.key, required this.movieId, required this.movieVideoEntity,});
  final int movieId;
  final MovieVideoEntity movieVideoEntity;

  @override
  State<MovieVideo> createState() => _MovieVideoState();
}

class _MovieVideoState extends State<MovieVideo> {
  
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with a video ID (use the key from TMDb API if fetching dynamically)
    _controller = YoutubePlayerController(
      initialVideoId:widget.movieVideoEntity.video , // Example YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return YoutubePlayer(
      
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.green,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.white,
      ),
    );
  }
}
