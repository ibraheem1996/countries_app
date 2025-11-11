import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';

class SectionLanguages extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionLanguages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Languages'),

          const SizedBox(height: 8),
          Text(
            data.languages.values.join(" , ") ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
