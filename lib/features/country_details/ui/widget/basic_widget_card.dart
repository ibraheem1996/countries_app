import 'package:countries/coor/helper/extension.dart';
import 'package:flutter/material.dart';
import '../../../../coor/theme/app_radius.dart';

class BasicWidgetCard extends StatelessWidget {
  final Widget child;
  const BasicWidgetCard(this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.scheme.surfaceContainerLowest,
      elevation: 7.5,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.r12),
      child: Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: child),
    );
  }
}

class RowInfo extends StatelessWidget {
  final String title;
  final String? value;
  final bool lastRow;

  const RowInfo(this.title, this.value, {super.key, this.lastRow = false});

  @override
  Widget build(BuildContext context) {
    if ((value ?? "").isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.w4, vertical: context.w4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Detect if long
          final painter = TextPainter(
            text: TextSpan(text: value),
            textDirection: TextDirection.ltr,
            maxLines: 1,
          )..layout(maxWidth: constraints.maxWidth * 0.6);

          final isMultiline = painter.didExceedMaxLines;

          if (isMultiline) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: context.h4),
                Text(value!, maxLines: 3, overflow: TextOverflow.ellipsis),
              ],
            );
          }

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Flexible(
                    child: Text(
                      value!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),

              if (lastRow != true) Divider(color: Colors.grey.shade400),
            ],
          );
        },
      ),
    );
  }
}

Widget textTitle(String title, BuildContext context) {
  return Center(
    child: Text(title, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
  );
}
