import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionCommunication extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionCommunication({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
final String idd = data.root != null ? '${data.root}${data.suffixes.join(",")}' : 'Unknown';

    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Communication'),
          rowInfo('Phone Code', idd),
          rowInfo('Drive Side', data.carSide),
          rowInfo('Car Signs', data.carSigns.join(", "), lastRow: true),
        ],
      ),
    );

  }
}
