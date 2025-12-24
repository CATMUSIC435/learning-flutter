import 'package:flutter/material.dart';
import 'package:biex/models/home_page_model.dart';

class AboutWidget {
  final AboutSection about;

  const AboutWidget({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAsixAlignment: CrossAxisAlignment.start,
        children: [
          Text(about.title,
          style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold
          )),
          const SizeBox(height: 8),
          Text(about.subTitle),
          const SizeBox(height: 16),
          ClipRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.netWork(about.image, fit: BoxFit.cover),
          )
        ] 
      )
    );
  }
}