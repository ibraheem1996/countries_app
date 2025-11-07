import 'package:flutter/material.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class SectionCommunication extends StatelessWidget {
  final DetailsModel data;
  const SectionCommunication({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String idd = data.idd != null
        ? '${data.idd!.root ?? ''}${data.idd!.suffixes?.join(",") ?? ''}'
        : 'Unknown';

    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Communication'),

          rowInfo('Phone Code', idd),
          rowInfo('Drive Side', data.car?.signs?.join(", ")),
          rowInfo('Car Signs', data.car?.side, lastRow: true),
        ],
      ),
    );
  }
}
