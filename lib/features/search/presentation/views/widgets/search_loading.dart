import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingvertical extends StatelessWidget {
  const ShimmerLoadingvertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        // physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 14.0),
            child: Row(
              children: [
                // CustomMovieImage shimmer placeholder
                SizedBox(
                  height: MediaQuery.of(context).size.height*.30,
                  child: AspectRatio(
                    aspectRatio: 1.4 / 1.9,
                    child: Container(
                      decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      ),
                      
                    
                    ),
                  ),
                ),

                const SizedBox(
                  width: 20,
                ),
                Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shimmer placeholder for title text
                    Container(
                      width: MediaQuery.of(context).size.width * .40,
                      height: 20, // Adjust the height for shimmer text
                      color: Colors.grey, // Shimmer placeholder for text
                    ),
                    const SizedBox(height: 10), // Spacing

                    // Shimmer placeholder for subtitle text
                    Container(
                      width: MediaQuery.of(context).size.width * .40,
                      height: 18, // Adjust the height for shimmer text
                      color: Colors.grey, // Shimmer placeholder for subtitle
                    ),
                    const SizedBox(height: 5), // Spacing

                    // Shimmer placeholder for additional text or rating
                    Container(
                      width: MediaQuery.of(context).size.width * .20,
                      height: 17, // Adjust the height for shimmer text
                      color: Colors.grey, // Shimmer placeholder
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 15.0),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //      SizedBox(
    //         height: 4,
    //       ),
    //       SizedBox(
    //           height: MediaQuery.of(context).size.height * .30,
    //           child: Shimmer.fromColors(
    //             direction: ShimmerDirection.ttb,
    //             baseColor: Colors.grey,
    //             highlightColor: Colors.grey[100]!,
    //             child: ListView.builder(
    //               itemCount: 10, // Number of shimmer items to show

    //               itemBuilder: (context, index) => AspectRatio(
    //                 aspectRatio: 1.4 / 1.9,
    //                 child: Container(
    //                   // Placeholder width
    //                   margin: const EdgeInsets.symmetric(horizontal: 8.0),
    //                   decoration: BoxDecoration(
    //                     color: Colors.grey[300],
    //                     borderRadius: BorderRadius.circular(8.0),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           )),
    //     ],
    //   ),
    // );

    // return SliverList.builder(
    //     itemCount: 20,
    //     itemBuilder: (context, index) {
    //       return Shimmer.fromColors(
    // baseColor: Colors.grey,
    // highlightColor: Colors.grey[100]!,
    //           child: Padding(
    //             padding: const EdgeInsets.only(bottom: 14.0),
    //             child: Row(
    //               children: [
    //                 Container(
    //                   height: MediaQuery.of(context).size.height * .30,
    //                   width: 100,
    //                   decoration: BoxDecoration(
    //                       color: Colors.grey,
    //                       borderRadius: BorderRadius.circular(16)),
    //                 ),
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width * .40,
    //                       child: Text(
    //                         '',
    //                         style: const TextStyle(
    //                           fontSize: 21,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                         maxLines: 2,
    //                         overflow: TextOverflow.ellipsis,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                         width: MediaQuery.of(context).size.width * .40,
    //                         child: Text(
    //                           '',
    //                           maxLines: 1,
    //                           overflow: TextOverflow.ellipsis,
    //                           style: const TextStyle(
    //                               color: Colors.grey, fontSize: 18),
    //                         )),
    //                     Text(
    //                       '',
    //                       style: const TextStyle(
    //                           color: Colors.amber, fontSize: 17),
    //                     )
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ));
    //     });

