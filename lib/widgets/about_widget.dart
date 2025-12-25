import 'package:flutter/material.dart';
import 'package:biex/models/home_page_model.dart';

class AboutWidget extends StatelessWidget {
  final AboutSection about;

  const AboutWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            about.title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(about.subTitle),
          const SizedBox(height: 16),
          ClipRect(
            // borderRadius: BorderRadius.circular(12),
            child: Align(
              alignment: Alignment.topCenter,
              heightFactor: 1,
              child: Image.network(about.image, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
