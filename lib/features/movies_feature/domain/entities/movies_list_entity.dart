class MoviesListEntity {
  final String? image;
  final int? id;
  final String? name;
  final String? overview;
  final num? poularity;
  final num? voteCountRate;

  MoviesListEntity(
      {required this.name,
      required this.overview,
      required this.poularity,
      required this.voteCountRate,
      required this.id,
      required this.image});

  factory MoviesListEntity.fromJson(data) {
    return MoviesListEntity(
      id: data["id"],
      image: data["poster_path"],
      name: data["title"],
      overview: data["overview"],
      poularity: data["popularity"],
      voteCountRate: data["vote_average"],
    );
  }
}
