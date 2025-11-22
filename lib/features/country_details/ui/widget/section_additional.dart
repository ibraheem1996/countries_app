import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionAdditional extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionAdditional({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Additional Info', context),

          SizedBox(height: context.h8),
          RowInfo('Driving Side', data.carSide),
          RowInfo('Plate Code', data.carSigns.join(" , ")),
          RowInfo('Timezone', data.timezones.join(" , ")),
          RowInfo('Start of Week', data.startOfWeek),
          RowInfo('Top-Level Domain', data.tld?.join(" , "), lastRow: true),
        ],
      ),
    );
  }
}
