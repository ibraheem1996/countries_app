import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class SectionStatistics extends StatelessWidget {
  final DetailsModel data;
  const SectionStatistics({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Statistics'),

          const SizedBox(height: 8),
          rowInfo('Population', '${data.population ?? "Unknown"}'),

          rowInfo('Area', '${data.area ?? 0} km²'),

          rowInfo('Currency', data.currencies?.syp?.name ?? "Unknown"),

          rowInfo('FIFA Code', data.fifa ?? "Unknown", lastRow: true),
        ],
      ),
    );
  }
}
