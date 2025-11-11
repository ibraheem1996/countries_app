import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';

class SectionBorders extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionBorders({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final borders = data.borders.join(" , ");
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Bordering Countries'),

          const SizedBox(height: 8),
          Text(borders, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
