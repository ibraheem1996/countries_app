import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionPeople extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionPeople({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('People'),

          const SizedBox(height: 8),
          rowInfo('English (Male)', data.demonymMaleEng),
          rowInfo('English (Female)', data.demonymFemaleEng),
          rowInfo('French (Male)', data.demonymMaleFra),
          rowInfo('French (Female)', data.demonymFemaleFra, lastRow: true),
        ],
      ),
    );
  }
}
