import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionAdditional extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionAdditional({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Additional Info'),
 

          const SizedBox(height: 10),
          rowInfo('Driving Side', data.carSide ),
          rowInfo('Plate Code', data.carSigns.join(" , ") ),
          rowInfo('Timezone', data.timezones.join(" , ") ),
          rowInfo('Start of Week', data.startOfWeek ),
          rowInfo('Gini Index', data.gini?.values.first.toString() ),
          rowInfo('Top-Level Domain', data.tld?.join(" , ") , lastRow: true),
        ],
      ),
    );
  }
}
