import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const AnimatedCard({super.key, required this.child, required this.onTap});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _pressed = false;

  void _setPressed(bool value) {
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => HapticFeedback.lightImpact(),
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapCancel: () => _setPressed(false),
        onTapUp: (_) async {
          _setPressed(false);
          await Future.delayed(const Duration(milliseconds: 120));
          widget.onTap();
        },
        child: AnimatedScale(
          scale: _pressed ? 0.92 : 1.0,
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
