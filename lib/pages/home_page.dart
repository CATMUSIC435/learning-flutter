import 'package:flutter/material.dart';
import 'package:biex/core/api/api_service.dart';
import 'package:biex/models/home_page_model.dart';
import 'package:biex/widgets/slider_widget.dart';
import 'package:biex/widgets/about_widget.dart';

import '../core/api/api_service.dart';
import '../widgets/slider_widget.dart';

class HomePage {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DXMD Vietnam')),
      body: FutureBuilder<HomePageModel>(
        future: ApiService.fetchHomePage(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if(snapshot.hasError) {
            return const Center(child: Text('Error load data'));
          }

          final data = snapshot.data!!;
          return SingleChildScrollView(
            child: Column(
              children: [
                SliderWidget(items: data.sliders),
                AboutWidget(items: data.about),
              ]
            )
          );
        }
      )
    );
  }
}