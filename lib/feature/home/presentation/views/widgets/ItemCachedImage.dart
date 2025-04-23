import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCachedImage extends StatelessWidget {
  const ItemCachedImage({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          //color: Colors.red,
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => const Icon(Icons.priority_high),
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
