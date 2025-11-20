import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class CountryIdentifiers extends StatelessWidget {
  final CountryDetailsEntities data;
  const CountryIdentifiers({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BasicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle('Country Codes', context),
          SizedBox(height: context.h8),

          _Row('CCA2', data.cca2),
          _Row('CCA3', data.cca3),
          _Row('CCN3', data.ccn3),
          _Row('CIOC', data.cioc),
          _Row('Status', data.status),
        ],
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.value);

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return value == null
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(vertical: context.h4),
            child: Row(
              children: [
                Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    value!,
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          );
  }
}
