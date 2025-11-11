import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../doman/entities.dart';
import 'basic_widget_card.dart';

class CountryLocation extends StatelessWidget {
  final CountryDetailsEntities data;
  const CountryLocation({super.key, required this.data});

  Future<void> _openMap() async {
    if (data.capitalLatlng != null && data.capitalLatlng!.length == 2) {
      final latitude = data.capitalLatlng![0];
      final longitude = data.capitalLatlng![1];

      final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
      );
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not open the map.');
      }
    } else if (data.googleMapsUrl != null) {
      final Uri url = Uri.parse(data.googleMapsUrl!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not open the map link.');
      }
    } else if (data.openStreetMapsUrl != null) {
      final Uri url = Uri.parse(data.openStreetMapsUrl!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not open the map link.');
      }
    }
  }

  String? _capital() {
    if (data.capital.isNotEmpty) {
      if (data.capital.any((c) => c == "Ramallah")) {
        return "Al-Quds";
      }
      return data.capital.first;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _openMap,
      child: basicWidgetCard(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_pin, color: Colors.blue, size: 36),
            const SizedBox(height: 8),
            Text(
              data.capital.isNotEmpty ? 'View ${_capital()} on Map' : 'View Country on Map',
              style: const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
