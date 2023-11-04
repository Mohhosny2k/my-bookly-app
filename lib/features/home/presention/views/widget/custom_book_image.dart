import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        // child: Container(
        //   // height: MediaQuery.of(context).size.height*.25,
        //   // width: 50,
        //   decoration: BoxDecoration(
        //    // color: Colors.red,
        //     borderRadius: BorderRadius.circular(16),
        //     image:  DecorationImage(
        //         fit: BoxFit.fill, image: NetworkImage(imageUrl)),
        //   ),
        // ),
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            // placeholder: (context, url) =>
            //     const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            imageUrl: imageUrl),
      ),
    );
  }
}
