import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionPostal extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionPostal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Postal Code'),

          const SizedBox(height: 8),
          rowInfo('Format', data.postalFormat),
          rowInfo('Regex', data.postalRegex, lastRow: true),
        ],
      ),
    );
  }
}
