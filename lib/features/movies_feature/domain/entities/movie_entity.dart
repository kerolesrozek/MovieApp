class MovieEntity {
  final String? image;
  final int? id;
  final String? name;
  final String? overview;
  final num? poularity;
  final num? voteCountRate;

  MovieEntity(
      {required this.name,
      required this.overview,
      required this.poularity,
      required this.voteCountRate,
      required this.id,
      required this.image});

  factory MovieEntity.fromJson(data) {
    return MovieEntity(
      id: data["id"],
      image: data["poster_path"],
      name: data["title"],
      overview: data["overview"],
      poularity: data["popularity"],
      voteCountRate: data["vote_average"],
    );
  }
}
