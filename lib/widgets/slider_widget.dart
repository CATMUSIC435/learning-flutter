import 'package:flutter/material.dart';
import 'package:biex/models/home_page_model.dart';
import 'package:biex/core/api/api_service.dart';

class SliderWidget extends StatelessWidget {
  final List<SliderItem> items;

  const SliderWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return FutureBuilder<String>(
            future: ApiService.fetchImageUrl(items[index].imgId),
            builder: (context, imgSnap) {
              if (!imgSnap.hasData) {
                return const SizedBox();
              }

              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgSnap.data!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        items[index].subTitle,
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
