import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/home_cubit.dart';

class AnimatedRetryButton extends StatefulWidget {
  const AnimatedRetryButton({super.key});

  @override
  State<AnimatedRetryButton> createState() => _AnimatedRetryButtonState();
}

class _AnimatedRetryButtonState extends State<AnimatedRetryButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onPressed() async {
    try {
      final cubit = context.read<HomeCubit>();
      await _controller.forward();
      await _controller.reverse();

      if (context.mounted) {
        cubit.getHomeData();
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 1.0,
        end: 1.2,
      ).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller),
      child: FloatingActionButton(
        heroTag: 'retry_button',
        onPressed: _onPressed,
        backgroundColor: Colors.blueAccent,
        child: RotationTransition(
          turns: Tween<double>(
            begin: 0,
            end: 1,
          ).chain(CurveTween(curve: Curves.easeInOutCubic)).animate(_controller),
          child: const Icon(Icons.refresh_rounded, size: 28),
        ),
      ),
    );
  }
}
