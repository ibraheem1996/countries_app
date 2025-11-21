import 'package:flutter/material.dart';

class AppShadows {
  static final List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha:  0.08),
      blurRadius: 14,
      spreadRadius: 1,
      offset: const Offset(0, 5),
    ),
  ];

  static final List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha:  0.04),
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    ),
  ];

  static final List<BoxShadow> heavyShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.12),
      blurRadius: 20,
      spreadRadius: 2,
      offset: const Offset(0, 8),
    ),
  ];
}
