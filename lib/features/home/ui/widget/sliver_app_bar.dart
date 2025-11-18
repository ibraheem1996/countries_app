import 'package:countries/coor/helper/extension.dart';
import 'package:countries/coor/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../coor/theme/theme_cubit.dart';

class CustomSliverAppBar extends StatefulWidget {
  final void Function(String? value) onSearchChanged;
  final void Function(String? value) onFilterChanged;

  const CustomSliverAppBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterChanged,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  final List<String> filters = ['Code', 'Name', 'Capital', 'Language'];
  int onTapIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      elevation: 3,
      toolbarHeight: context.width * 0.27,
      flexibleSpace: SafeArea(
        // padding: EdgeInsets.fromLTRB(context.w16, context.height * 0.05, context.w16, context.h8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: context.height * 0.048,
                      minHeight: context.height * 0.040,
                    ),
                    child: TextField(
                      onChanged: widget.onSearchChanged,
                      decoration: InputDecoration(
                        hintText: "Search country...",
                        prefixIcon: const Icon(Icons.search),
                        border: const OutlineInputBorder(
                          borderRadius: AppRadius.r12,
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: context.scheme.surfaceContainerLowest,
                        contentPadding: EdgeInsets.symmetric(vertical: context.w4),
                      ),
                    ),
                  ),
                ),
                BlocBuilder<ThemeCubit, ThemeMode>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.w4),
                      child: InkWell(
                        onTap: () {
                          context.read<ThemeCubit>().toggleTheme();
                        },
                        child: Icon(state == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: context.h16),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: context.height * 0.050,
                minHeight: context.height * 0.035,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(filters.length, (index) {
                  final isSelected = index == onTapIndex;
                  return ChoiceChip(
                    backgroundColor: context.scheme.surfaceContainerLowest,
                    shape: const StadiumBorder(),

                    // const RoundedRectangleBorder(borderRadius: AppRadius.r8),
                    label: Text(
                      filters[index],
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: context.scheme.primary,
                    onSelected: (_) {
                      setState(() {
                        if (onTapIndex == index) {
                          onTapIndex = -1;
                          widget.onFilterChanged(null);
                        } else {
                          onTapIndex = index;
                          widget.onFilterChanged(filters[index]);
                        }
                      });
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
