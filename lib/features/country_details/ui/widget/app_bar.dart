import 'package:countries/features/country_details/data/model/details_model.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List <DetailsModel> data;
  const CustomSliverAppBar({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Country Details'),
        background: Image.network(data.first.coatOfArms?.svg ?? data.first.coatOfArms!.png!, fit: BoxFit.cover),
      ),
    );
  }
}
