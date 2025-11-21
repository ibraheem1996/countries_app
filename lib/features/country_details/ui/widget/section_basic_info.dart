import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class SectionBasicInfo extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionBasicInfo({super.key, required this.data});
  String? _capital() {
    if (data.capital.any((c) => c == "Ramallah")) {
      return "Alqds";
    }
    return data.capital.join(" , ");
  }

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Basic Info', context),

          RowInfo('Official Name', data.nameOfficial),
          RowInfo("Capital", _capital()),
          RowInfo("Region", data.region),
          RowInfo("Subregion", data.subregion),
          RowInfo("Independent", data.independent == true ? "Yes" : "No"),
          RowInfo("UN Member", data.unMember == true ? "Yes" : "No", lastRow: true),
        ],
      ),
    );
  }
}
