import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionPeople extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionPeople({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('People', context),

          const SizedBox(height: 8),
          RowInfo('English (Male)', data.demonymMaleEng),
          RowInfo('English (Female)', data.demonymFemaleEng),
          RowInfo('French (Male)', data.demonymMaleFra),
          RowInfo('French (Female)', data.demonymFemaleFra, lastRow: true),
        ],
      ),
    );
  }
}
