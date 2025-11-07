import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class CountryGeography extends StatelessWidget {
  final DetailsModel data;
  const CountryGeography({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final latlng = data.latlng != null ? '${data.latlng![0]}, ${data.latlng![1]}' : 'Unknown';
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Geography'),

          const SizedBox(height: 8),
          rowInfo('Region', data.region),
          rowInfo('Subregion', data.subregion),
          rowInfo('Coordinates', latlng),
          rowInfo('Landlocked', data.landlocked == true ? 'Yes' : 'No'),
          rowInfo('Area', data.area?.toStringAsFixed(0), lastRow: true),
        ],
      ),
    );
  }
}
