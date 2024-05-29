import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.radius = 20.0,
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              image: imageProvider,
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
        );
      },
      placeholder: (BuildContext context, String url) => Container(),
      // If error happens load image by using NetworkImage
      errorWidget: (context, url, error) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              scale: 1,
            ),
          ),
        );
      },
    );
  }
}
