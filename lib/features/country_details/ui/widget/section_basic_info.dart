import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class SectionBasicInfo extends StatelessWidget {
  final DetailsModel data;
  const SectionBasicInfo({super.key, required this.data});
  String? _capital() {
    if (data.capital != null && data.capital!.isNotEmpty) {
      if (data.capital!.any((c) => c == "Ramallah")) {
        return "Alqds";
      }
      return data.capital!.join(" , ");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Basic Info'),

          rowInfo('Official Name', data.name.official),
          rowInfo("Capital", _capital()),
          rowInfo("Region", data.region),
          rowInfo("Subregion", data.subregion),
          rowInfo("Independent", data.independent == true ? "Yes" : "No"),
          rowInfo("UN Member", data.unMember == true ? "Yes" : "No", lastRow: true),
        ],
      ),
    );
  }
}
