import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:verdora_app/core/extensions/src/build_context_etx.dart';

class TransparentImage extends StatelessWidget {
  const TransparentImage({
    required this.url,
    super.key,
    this.borderRadius = 0,
    this.local = false,
    this.fit = BoxFit.cover,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.enableCache = false,
    this.errorPath,
    this.memCacheHeight,
    this.placeHolderAspectRatio,
    this.progressIndicatorBuilder,
    this.errorWidget,
    this.placeHolder,
    this.placeholder,
  });

  final String? url;
  final bool local;
  final double borderRadius;
  final BoxFit fit;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool enableCache;
  final String? errorPath;
  final int? memCacheHeight;
  final double? placeHolderAspectRatio;
  final Widget Function(BuildContext, String)? placeholder;
  final Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder;
  final Widget? errorWidget;
  final Widget? placeHolder;
  

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: local
            ? Image.asset(
                url!,
                fit: fit,
                errorBuilder: (context, _, __) => Image.asset(
                  errorPath ?? 'assets/images/placeholder.png',
                  fit: BoxFit.cover,
                ),
              )
            : enableCache
                ? isValidUrl(url ?? '')
                    ? CachedNetworkImage(
                        imageUrl: url ?? '',
                        memCacheHeight: memCacheHeight,
                        progressIndicatorBuilder: progressIndicatorBuilder,
                        errorWidget: (context, _, __) =>
                            errorWidget ??
                            AspectRatio(
                              aspectRatio: 1,
                              child: Image.asset(
                                errorPath ?? 'assets/images/placeholder.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                        placeholder: (_, __) =>
                            placeHolder ??
                            (placeHolderAspectRatio != null
                                ? AspectRatio(
                                    aspectRatio: placeHolderAspectRatio!,
                                    child: Container(
                                      color: colors.lightShadeGrey20,
                                    ),
                                  )
                                : Container(
                                    color: colors.lightShadeGrey20,
                                  )),
                        fit: fit,
                        // errorListener: (value) {
                        //   print('error image  : $value');
                        // },

                        // cacheManager: CacheManager(Config(
                        //   "post_image",
                        //   stalePeriod: const Duration(days: 3),
                        //   //one week cache period
                        // )),
                      )
                    : errorWidget ??
                        Image.asset(
                          errorPath ?? 'assets/images/placeholder.png',
                          fit: BoxFit.cover,
                        )
                : FadeInImage.memoryNetwork(
                    fit: fit,
                    placeholder: kTransparentImage,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        Image.asset(
                      errorPath ?? 'assets/images/placeholder.png',
                      fit: BoxFit.cover,
                    ),
                    image: url ?? '',
                  ),
      ),
    );
  }
}

bool isValidUrl(String url) {
  try {
    final uri = Uri.parse(url);
    return uri.isAbsolute && uri.host.isNotEmpty;
  } catch (e) {
    return false;
  }
}
