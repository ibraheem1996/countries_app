import 'package:flutter/material.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class CountryIdentifiers extends StatelessWidget {
  final CountryDetailsEntities data;
  const CountryIdentifiers({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return basicWidgetCard(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitel('Country Codes'),
          const SizedBox(height: 8),
          _row('CCA2', data.cca2),
          _row('CCA3', data.cca3),
          _row('CCN3', data.ccn3),
          _row('CIOC', data.cioc),
          _row('Status', data.status),
        ],
      ),
    );
  }

  Widget _row(String label, String? value) => value == null
      ? const SizedBox.shrink()
      : Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(width: 5),
              Expanded(
                child: Text(value, style: const TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        );
}
