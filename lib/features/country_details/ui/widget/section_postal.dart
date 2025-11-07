import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class SectionPostal extends StatelessWidget {
  final DetailsModel data;
  const SectionPostal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Postal Code'),

          const SizedBox(height: 8),
          rowInfo('Format', data.postalCode?.format),
          rowInfo('Regex',  data.postalCode?.regex, lastRow: true),
        ],
      ),
    );
  }
}
