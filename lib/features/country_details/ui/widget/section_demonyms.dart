import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class SectionPeople extends StatelessWidget {
  final DetailsModel data;
  const SectionPeople({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('People'),

          const SizedBox(height: 8),
          rowInfo('English (Male)', data.demonyms?.eng?.m),
          rowInfo('English (Female)', data.demonyms?.eng?.f),
          rowInfo('French (Male)', data.demonyms?.fra?.m),
          rowInfo('French (Female)', data.demonyms?.fra?.f, lastRow: true),
        ],
      ),
    );
  }
}
