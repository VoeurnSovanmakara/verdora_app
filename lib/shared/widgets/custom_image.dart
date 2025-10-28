import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    required this.url,
    super.key,
    this.borderRadius,
    this.local = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.borderColor,
    this.enableCache = false,
    this.errorUrl,
    this.memCacheHeight,
    this.placeHolderAspectRatio,
    this.width,
    this.height,
  });

  final String? url;
  final bool local;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enableCache;
  final String? errorUrl;
  final int? memCacheHeight;
  final double? placeHolderAspectRatio;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: borderRadius,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: local
            ? Image.file(
                File(url!),
                fit: fit,
                errorBuilder: (context, _, _) => Image.asset(
                  errorUrl ?? 'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              )
            : enableCache
            ? CachedNetworkImage(
                imageUrl: url ?? '',
                width: width,
                height: height,
                memCacheHeight: memCacheHeight,
                errorWidget: (context, _, _) => Image.asset(
                  errorUrl ?? 'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
                placeholder: (_, _) => placeHolderAspectRatio != null
                    ? AspectRatio(
                        aspectRatio: placeHolderAspectRatio!,
                        child: Container(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withValues(alpha: 0.1),
                        ),
                      )
                    : Container(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.1),
                      ),
                fit: fit,
              )
            : Image.asset(
                url!,
                fit: fit,
                errorBuilder: (context, _, _) => Image.asset(
                  errorUrl ?? 'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
        // : FadeInImage.memoryNetwork(
        //     fit: fit,
        //     placeholder: kTransparentImage,
        //     imageErrorBuilder: (context, error, stackTrace) =>
        //         Image.asset(
        //       errorUrl ?? "assets/images/logo.png",
        //       fit: BoxFit.cover,
        //     ),
        //     image: url ?? "",
        //   ),
      ),
    );
  }
}
