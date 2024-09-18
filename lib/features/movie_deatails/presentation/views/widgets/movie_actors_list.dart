
import 'package:flutter/material.dart';
import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';
import 'package:moviesapp/features/movie_deatails/presentation/views/widgets/person_data.dart';

class MovieActorsList extends StatelessWidget {
  const MovieActorsList({
    super.key, required this.persons,
  });
final List<MoviePersonEntity>persons;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: persons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PersonData(
              person: persons[index],
            );
          }),
    );
  }
}
