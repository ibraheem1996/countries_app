import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../doman/entities.dart';

class DetailsHeader extends StatefulWidget {
  final CountryDetailsEntities data;
  const DetailsHeader({super.key, required this.data});

  @override
  State<DetailsHeader> createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  int currentImage = 0;

  List<String> get images {
    final flag = widget.data.flagSvg ?? widget.data.flagPng;
    final coat = widget.data.coatSvg ?? widget.data.coatPng;

    return [flag, coat].whereType<String>().where((e) => e.isNotEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 450,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(widget.data.nameCommon, style: const TextStyle(fontWeight: FontWeight.bold)),
        background: Stack(
          fit: StackFit.expand,
          children: [
            PageView.builder(
              itemCount: images.length,
              onPageChanged: (index) => setState(() => currentImage = index),
              itemBuilder: (context, index) {
                final image = images[index];

                return image.toLowerCase().endsWith('.png')
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        placeholder: (_, __) => const Center(
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (_, __, ___) =>
                            const Center(child: Icon(Icons.error, color: Colors.red)),
                      )
                    : SvgPicture.network(image, fit: BoxFit.cover);
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
