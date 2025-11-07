import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../data/model/details_model.dart';
import 'basic_widget_card.dart';

class CountryLocation extends StatelessWidget {
  final DetailsModel data;
  const CountryLocation({super.key, required this.data});

  Future<void> _openMap() async {
    final List<double>? latlng = data.capitalInfo?.latlng;
    if (latlng != null && latlng.length == 2) {
      final double latitude = latlng[0];
      final double longitude = latlng[1];

      final Uri url = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
      );
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not open the map.');
      }
    } else if (data.maps?.googleMaps != null) {
      final Uri url = Uri.parse(data.maps!.googleMaps!);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not open the map link.');
      }
    }
  }

  String? _capital() {
    if (data.capital != null && data.capital!.isNotEmpty) {
      if (data.capital!.any((c) => c == "Ramallah")) {
        return "Alqds";
      }
      return data.capital!.first;
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
              data.capital != null && data.capital!.isNotEmpty
                  ? 'View ${_capital()} on map'
                  : 'View Country on Map',
              style: const TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
