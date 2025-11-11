import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';

import '../../doman/entities.dart';

class SectionFlagInfo extends StatelessWidget {
  final CountryDetailsEntities detailsModel;
  const SectionFlagInfo({super.key, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(Text("${detailsModel.flag ?? ""}  ${detailsModel.flagAlt??""}"));
  }
}
