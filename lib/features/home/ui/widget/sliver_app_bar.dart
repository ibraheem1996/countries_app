import 'package:countries/coor/helper/extension.dart';
import 'package:countries/coor/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../coor/theme/theme_cubit.dart';
import '../../logic/home_cubit.dart';

class CustomSliverAppBar extends StatefulWidget {
  final void Function(String? value) onSearchChanged;
  final void Function(String? value) onFilterChanged;
  final DataSource? dataSource;

  const CustomSliverAppBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterChanged,
    this.dataSource,
  });

  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  final List<String> filters = ['Code', 'Name', 'Capital', 'Language'];
  int onTapIndex = -1;

  @override
  Widget build(BuildContext context) {
    final shouldShowIndicator = widget.dataSource == DataSource.local;

    double toolbarHeight() {
      final portrait = MediaQuery.of(context).orientation == Orientation.portrait;
      final landscape = MediaQuery.of(context).orientation == Orientation.landscape;
      if (portrait && widget.dataSource == DataSource.local) {
        return context.width * 0.40;
      } else if (landscape && widget.dataSource == DataSource.local) {
        return context.width * 0.20;
      } else if (portrait && widget.dataSource == DataSource.remote) {
        return context.width * 0.27;
      } else if (landscape && widget.dataSource == DataSource.remote) {
        return context.width * 0.12;
      }
      return 0;
    }

    return SliverAppBar(
      pinned: false,
      floating: true,
      elevation: 3,
      toolbarHeight: toolbarHeight(),

      flexibleSpace: SafeArea(
        child: Column(
          children: [
            if (shouldShowIndicator) _buildDataSourceIndicator(context),
            Row(
              children: [
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: context.height * 0.055,
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
                maxHeight: context.height * 0.90,
                minHeight: context.height * 0.035,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(filters.length, (index) {
                  final isSelected = index == onTapIndex;
                  return ChoiceChip(
                    backgroundColor: context.scheme.surfaceContainerLowest,
                    shape: const StadiumBorder(),
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

  Widget _buildDataSourceIndicator(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final screenWidth = context.width;
    final screenHeight = context.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.012),
      decoration: BoxDecoration(
        color: context.scheme.errorContainer.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(screenWidth * 0.02), // 2% من العرض
        border: Border.all(color: context.scheme.errorContainer.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_rounded,
            size: isPortrait ? screenHeight * 0.02 : screenWidth * 0.04,
            color: context.scheme.errorContainer,
          ),
          SizedBox(width: screenWidth * 0.02),
          Flexible(
            child: Text(
              'You are currently viewing local data. Some features may not work as expected.',
              style: TextStyle(
                fontSize: isPortrait ? screenHeight * 0.016 : screenWidth * 0.03,
                fontWeight: FontWeight.w500,
                color: context.scheme.onErrorContainer,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
