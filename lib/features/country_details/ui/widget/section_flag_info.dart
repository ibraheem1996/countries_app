import 'package:countries/features/country_details/data/model/details_model.dart';
import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';

class  SectionFlagInfo extends StatelessWidget {
  final DetailsModel detailsModel;
  const  SectionFlagInfo({super.key, required this.detailsModel});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(Text("${detailsModel.flag ?? ""}  ${detailsModel.flags?.alt ?? ""}"));
  }
}
