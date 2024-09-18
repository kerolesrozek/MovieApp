import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:moviesapp/features/movie_deatails/domain/entities/movie_person_entity.dart';

class PersonData extends StatelessWidget {
  const PersonData({
    super.key,
    required this.person,
  });
  final MoviePersonEntity person;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                  
                  errorWidget: (context, url, error) =>const Icon(Icons.error),
                  imageUrl: 'https://image.tmdb.org/t/p/w500${person.photo}'),
          ),
          Text(
            person.name ?? "keroles",
            maxLines: person.name!.length,
            style: const TextStyle(fontWeight: FontWeight.bold),
            
          ),
        ],
      ),
    );
  }
}

