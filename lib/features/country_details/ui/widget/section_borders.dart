import 'package:countries/coor/helper/extension.dart';
import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';

class SectionBorders extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionBorders({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final borders = data.borders.join(" , ");
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Bordering Countries', context),

          SizedBox(height: context.h8),
          Text(borders, maxLines: 2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
