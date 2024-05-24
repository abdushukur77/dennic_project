import 'package:cached_network_image/cached_network_image.dart';
import 'package:dennic_project/screens/global_widget/shimer_widget.dart';
import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
  });

  final String imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    debugPrint('-----------$imageUrl');
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => ShimmerWidget(
        width: width,
        height: height,
      ),
      errorWidget: (context, url, error) => Image.asset(
        "assets/images/error.png",
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
      errorListener: (error) {
        debugPrint('cached network: $error');
      },
    );
  }
}
