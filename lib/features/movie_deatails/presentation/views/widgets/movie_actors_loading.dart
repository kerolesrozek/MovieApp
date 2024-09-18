
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieActorsLoading extends StatelessWidget {
  const MovieActorsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: 100,
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 50,
              );
            }),
      ),
    );
  }
}
