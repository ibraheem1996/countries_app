import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities.dart';

Widget buildNameAndCode(Country country, BuildContext context) {
  final subName = country.capital =="" ? country.region :  country.capital;
  return Container(
    padding: EdgeInsets.symmetric( vertical: context.h4),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [context.scheme.surfaceContainerLowest, context.scheme.surfaceContainerLow],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(18)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          country.name,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: context.h4),
        Text(
          subName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.bodyMedium,
        ),
      ],
    ),
  );
}
