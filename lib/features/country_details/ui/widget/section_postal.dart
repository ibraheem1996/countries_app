import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionPostal extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionPostal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Postal Code', context),

          SizedBox(height: context.h8),
          RowInfo('Format', data.postalFormat),
          RowInfo('Regex', data.postalRegex, lastRow: true),
        ],
      ),
    );
  }
}
