class MovieVideoEntity {
  final String video;

  MovieVideoEntity({required this.video});

  factory MovieVideoEntity.fromJson(data) {
    return MovieVideoEntity(
      video: data["results"][0]["key"],
    );
  }
}









