import 'package:countries/features/country_details/doman/entities.dart';
import 'package:flutter/material.dart';
import 'basic_widget_card.dart';

class SectionStatistics extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionStatistics({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Statistics', context),

          const SizedBox(height: 8),
          RowInfo('Population', '${data.population ?? "Unknown"}'),

          RowInfo('Area', '${data.area ?? 0} km²'),

          RowInfo('Currency', data.currencies),

          RowInfo('FIFA Code', data.fifa, lastRow: true),
        ],
      ),
    );
  }
}
