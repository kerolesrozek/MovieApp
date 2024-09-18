import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
       const   SizedBox(
            height: 4,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * .30,
              child: Shimmer.fromColors(
                
                baseColor: Colors.grey,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  itemCount: 5, // Number of shimmer items to show
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 1.4 / 1.9,
                    child: Container(
                   
                      margin:const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
