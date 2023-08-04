import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/colors.dart';

class ImageHolder {
  static netWorkImage({required String url}) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) {
        return SizedBox(
          height: 130,
          child: SpinKitThreeBounce(
            color: kLightPrimaryColor.withOpacity(0.5),
            size: 20.0,
          ),
        );
      },
      // progressIndicatorBuilder: (context, url, downloadProgress) => Center(
      //   child: SizedBox(
      //       width: 25,
      //       height: 25,
      //       child: CircularProgressIndicator(value: downloadProgress.progress)),
      // ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );

    // FadeInImage.memoryNetwork(
    //   placeholder: kTransparentImage,
    //   image: url,
    //   // fit: BoxFit.cover,
    //   imageErrorBuilder: ((context, error, stackTrace) =>
    //       const Center(child: Icon(Icons.error))),
    // );
  }
}
