import 'package:countries/features/country_details/ui/widget/basic_widget_card.dart';
import 'package:flutter/material.dart';
import '../../doman/entities.dart';

class SectionTranslations extends StatelessWidget {
  final CountryDetailsEntities data;
  const SectionTranslations({super.key, required this.data});

@override
  Widget build(BuildContext context) {
    final translations = data.translations;

    return basicWidgetCard(
      ExpansionTile(
        title: const Text('Translations'),
        children: (translations ?? {}).entries
            .map(
              (e) => ListTile(
                title: Text(e.key.toUpperCase()),
                subtitle: Text('${e.value["common"] ?? ""} (${e.value["official"] ?? ""})'),
              ),
            )
            .toList(),
      ),
    );
  }

}
