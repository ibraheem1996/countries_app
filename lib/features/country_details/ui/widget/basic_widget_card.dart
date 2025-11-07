import 'package:flutter/material.dart';

Widget basicWidgetCard(Widget child) {
  return Card(
    elevation: 7.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
    child: Padding(padding: const EdgeInsets.all(16), child: child),
  );
}

Widget rowInfo(String title, String? value, {bool lastRow = false}) {
  if (value == null || value.isEmpty) return const SizedBox.shrink();

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final TextSpan span = TextSpan(text: value);
        final TextPainter tp = TextPainter(
          text: span,
          textDirection: TextDirection.ltr,
          maxLines: 1,
        )..layout(maxWidth: constraints.maxWidth * 0.6);

        final isMultiline = tp.didExceedMaxLines;

        if (isMultiline) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 3),
              Text(value, maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          );
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
                Flexible(
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
            if (!lastRow) Divider(color: Colors.grey.shade400),
          ],
        );
      },
    ),
  );
}

Widget textTitel(String title) {
  return Center(
    child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
  );
}
