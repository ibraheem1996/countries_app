import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildFlag(String? url) {
  return () {
    if (url == null) {
      return const Center(child: Icon(Icons.flag_circle_outlined, size: 100, color: Colors.grey));
    }

    if (url.endsWith('.png')) {
      return CachedNetworkImage(
        memCacheHeight: 200,
        memCacheWidth: 200,
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (_, __) => const Center(
          child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        errorWidget: (_, __, ___) =>
            const Center(child: Icon(Icons.error_outline, color: Colors.red)),
      );
    }

    return SvgPicture.network(
      url,
      fit: BoxFit.cover,
      placeholderBuilder: (_) => const Center(
        child: SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2)),
      ),
    );
  }();
}
