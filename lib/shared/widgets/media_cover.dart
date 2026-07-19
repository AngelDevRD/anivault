import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Portada de una obra con caché de red y placeholder consistente.
class MediaCover extends StatelessWidget {
  const MediaCover({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.radius = 12,
  });

  final String? url;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final placeholder = Container(
      width: width,
      height: height,
      color: scheme.surfaceContainerHighest,
      child: Icon(Icons.image_outlined, color: scheme.outline),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: url == null || url!.isEmpty
          ? placeholder
          : CachedNetworkImage(
              imageUrl: url!,
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholder: (_, _) => placeholder,
              errorWidget: (_, _, _) => placeholder,
            ),
    );
  }
}
