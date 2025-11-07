import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;

  const CustomSliverAppBar({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      elevation: 2,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 8),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          child: TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: "Search country...",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
    );
  }
}
