import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/model/details_model.dart';

class DetailsHeader extends StatefulWidget {
  final DetailsModel data;
  const DetailsHeader({super.key, required this.data});

  @override
  State<DetailsHeader> createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  int currentImage = 0;

  List<String> get images {
    final flag = widget.data.flags?.svg ?? widget.data.flags?.png;
    final coat = widget.data.coatOfArms?.svg ?? widget.data.coatOfArms?.png;
    return [flag, coat].whereType<String>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 450,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          widget.data.name.common ?? '',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              itemCount: images.length,
              onPageChanged: (index) => setState(() => currentImage = index),
              itemBuilder: (context, index) {
                final image = images[index];
                return image.endsWith('.svg')
                    ? SvgPicture.network(image, fit: BoxFit.cover)
                    : Image.network(image, fit: BoxFit.cover);
              },
            ),
            Positioned(
              bottom: 10,
              right: 10,
              // left: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${currentImage + 1}/${images.length}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
