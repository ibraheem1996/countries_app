import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,
      toolbarHeight: 110,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: const EdgeInsets.fromLTRB(16, 35, 16, 8),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: TextField(
                  onChanged: widget.onSearchChanged,
                  decoration: InputDecoration(
                    hintText: "Search country...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(filters.length, (index) {
                    final isSelected = index == onTapIndex;
                    return ChoiceChip(
                      label: Text(
                        filters[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: Colors.blue,
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
      ),
    );
  }
}
