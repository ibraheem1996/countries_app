import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionCommunication extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionCommunication({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String idd = data.root != null ? '${data.root}${data.suffixes.join(",")}' : 'Unknown';

    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Communication', context),
          RowInfo('Phone Code', idd),
          RowInfo('Drive Side', data.carSide),
          RowInfo('Car Signs', data.carSigns.join(", "), lastRow: true),
        ],
      ),
    );
  }
}
