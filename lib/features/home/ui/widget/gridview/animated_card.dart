// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AnimatedCard extends StatefulWidget {
//   final Widget child;
//   final VoidCallback onTap;

//   const AnimatedCard({super.key, required this.child, required this.onTap});

//   @override
//   State<AnimatedCard> createState() => _AnimatedCardState();
// }

// class _AnimatedCardState extends State<AnimatedCard> {
//   double _scale = 1.0;

//   void _onTapDown(TapDownDetails _) {
//     HapticFeedback.lightImpact();
//     setState(() => _scale = 0.90);
//   }

//   void _onTapUp(TapUpDetails _) async {
//     await Future.delayed(const Duration(milliseconds: 150));

//     setState(() => _scale = 1.0);

//     await Future.delayed(const Duration(milliseconds: 350));

//     widget.onTap();
//   }

//   void _onTapCancel() {
//     setState(() => _scale = 1.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("===================== build AnimatedCard");
//     print("===================== build AnimatedCard");
//     print("===================== build AnimatedCard");
//     return GestureDetector(
//       onTapDown: _onTapDown,
//       onTapUp: _onTapUp,
//       onTapCancel: _onTapCancel,
//       child: AnimatedScale(
//         scale: _scale,
//         duration: const Duration(milliseconds: 350),
//         curve: Curves.easeOut,
//         child: widget.child,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnimatedCard extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;

  const AnimatedCard({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => HapticFeedback.lightImpact(),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 1.0),
        duration: const Duration(milliseconds: 0),
        builder: (context, _, __) {
          return GestureDetector(
            onTapDown: (details) {
              // ↓↓↓ استخدم ValueNotifier بدون أي setState ↓↓↓
              PressScale.of(context)?.press();
            },
            onTapUp: (details) async {
              PressScale.of(context)?.release();
              await Future.delayed(const Duration(milliseconds: 120));
              onTap();
            },
            onTapCancel: () {
              PressScale.of(context)?.release();
            },
            child: PressScale(child: child),
          );
        },
      ),
    );
  }
}

class PressScale extends InheritedWidget {
  final ValueNotifier<bool> _pressed = ValueNotifier(false);

  PressScale({required super.child, super.key});

  // ignore: library_private_types_in_public_api
  static _PressScaleController? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<PressScale>();
    return widget == null ? null : _PressScaleController(widget._pressed);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pressed,
      builder: (context, isPressed, child) {
        return Transform.scale(scale: isPressed ? 0.92 : 1.0, child: child);
      },
      child: child,
    );
  }
}

class _PressScaleController {
  final ValueNotifier<bool> notifier;
  _PressScaleController(this.notifier);

  void press() => notifier.value = true;
  void release() => notifier.value = false;
}
