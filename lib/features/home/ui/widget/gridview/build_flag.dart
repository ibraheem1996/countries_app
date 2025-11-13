import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildFlag(String? url) {
  return ClipRRect(
    borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
    child: () {
      if (url == null) {
        return const Center(child: Icon(Icons.flag_circle_outlined, size: 100, color: Colors.grey));
      }

      if (url.endsWith('.svg')) {
        return SvgPicture.network(
          url,
          fit: BoxFit.cover,
          placeholderBuilder: (_) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      }

      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (_, __) => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (_, __, ___) =>
            const Center(child: Icon(Icons.error_outline, color: Colors.red)),
      );
    }(),
  );
}
