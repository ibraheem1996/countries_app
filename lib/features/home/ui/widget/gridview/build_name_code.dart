import 'package:flutter/material.dart';

import '../../../domain/entities.dart';

Widget buildNameAndCode(Country country) {
  final subName = (country.capital.isNotEmpty && country.capital.first.isNotEmpty)
      ? country.capital.first
      : country.nameCommon ?? country.nameOfficial ?? "";

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blueGrey.shade50, Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          country.nameCommon ?? country.nameOfficial ?? "",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Text(
            subName.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    ),
  );
}
