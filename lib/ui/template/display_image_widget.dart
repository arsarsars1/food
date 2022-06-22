import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/export.dart';

class DisplayImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double radius;
  final BorderRadius? borderRadius;
  const DisplayImage(
      {Key? key,
      required this.url,
      this.height,
      this.width,
      this.radius = 20,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: BoxFit.cover,
          useOldImageOnUrlChange: true,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                      borderRadius:
                          borderRadius ?? BorderRadius.circular(radius),
                      border: Border.all(color: ColorsCustom.black)),
                  child: const CupertinoActivityIndicator(
                      radius: 20, color: ColorsCustom.black)),
          errorWidget: (context, url, error) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(radius),
                  border: Border.all(color: ColorsCustom.black)),
              child: const Icon(Icons.error, color: ColorsCustom.black))),
    );
  }
}
