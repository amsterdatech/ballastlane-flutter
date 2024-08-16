import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageUrl;

  RoundedImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        color: Colors.grey[200], // Background color for placeholder
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(), // Show loading indicator
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          // Show error icon
          fit: BoxFit.cover, // Adjust image to cover the container
        ),
      ),
    );
  }
}
