import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class CountryGeography extends StatelessWidget {
  final CountryDetailsEntities data;
  const CountryGeography({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final latlng = data.latlng != null ? '${data.latlng![0]}, ${data.latlng![1]}' : 'Unknown';
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Geography', context),

          SizedBox(height: context.h8),
          RowInfo('Region', data.region),
          RowInfo('Subregion', data.subregion),
          RowInfo('Coordinates', latlng),
          RowInfo('Landlocked', data.landlocked == true ? 'Yes' : 'No'),
          RowInfo('Area', data.area?.toStringAsFixed(0), lastRow: true),
        ],
      ),
    );
  }
}
