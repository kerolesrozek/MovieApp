class MoviePersonEntity {
  final String? name;
  final String? photo;

  MoviePersonEntity({required this.name, required this.photo});

  factory MoviePersonEntity.formJson(data) {
    return MoviePersonEntity(
      name: data["original_name"],
      photo: data["profile_path"],
    );
  }
}
