import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../coor/theme/app_radius.dart';
import '../../logic/home_cubit.dart';

class RetryWidget extends StatefulWidget {
  final String message;
  final Icon icon;
  const RetryWidget({super.key, required this.message, required this.icon});

  @override
  State<RetryWidget> createState() => _RetryWidgetState();
}

class _RetryWidgetState extends State<RetryWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))
      ..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _retry() {
    final cubit = context.read<HomeCubit>();
    cubit.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.h36, child: widget.icon),
            SizedBox(height: context.h20),
            Text(
              widget.message,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge,
            ),
            SizedBox(height: context.h24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.scheme.primary,
                shape: const RoundedRectangleBorder(borderRadius: AppRadius.r12),
                padding: EdgeInsets.symmetric(horizontal: context.w24, vertical: context.w12),
              ),
              onPressed: _retry,
              icon: Icon(Icons.refresh_rounded, color: context.scheme.onPrimary),
              label: Text(
                "Retry",
                style: context.textTheme.bodyLarge?.copyWith(color: context.scheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
