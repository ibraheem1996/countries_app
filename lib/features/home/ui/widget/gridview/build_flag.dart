import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildFlag(String? url) {
  if (url == null) {
    return const Center(child: Icon(Icons.flag_circle_outlined, size: 70, color: Colors.grey));
  }

  final lower = url.toLowerCase();

  final isPng = lower.endsWith('.png');

  if (isPng) {
    return CachedNetworkImage(
      imageUrl: url,
      memCacheHeight: 200,
      memCacheWidth: 200,
      fit: BoxFit.cover,
      placeholder: (_, __) => const Center(
        child: SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      errorWidget: (_, __, ___) =>
          const Center(child: Icon(Icons.error_outline, color: Colors.red)),
    );
  }

  return SvgPicture.network(
    url,
    fit: BoxFit.cover,
    placeholderBuilder: (_) => const Center(
      child: SizedBox(height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2)),
    ),

  );
}
