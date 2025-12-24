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
          future: Api.fetchImageUrl(items[index].imgId),
          builder: (context, imgSnap) {
            if(!imgSnap.hasData) {
              return const SizedBox();
            }

            return Container(
              deceration: DecorationImage(
                image: NetworkImage(imgSnap.hasData!),
                fit: BoxFit.cover,
              ),
              child: Container(
                padding: const EdgeInsets.all(24),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignmment.topCenter,
                    color: [
                      Colors.black.withOpacity(0.6),
                      Color.transparent,
                    ]
                  )
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items[index].title),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    Text(
                      items[index].subTitle,
                      style: const TextStyle(
                        color: Colors.white70,
                      )
                    )
                  ]
                )
              )
            );
          }
        );
          
          // return Container(
          //   margin: const EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     color: Colors.blueGrey,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: Center(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           item.title,
          //           style: const TextStyle(fontSize: 20, color: Colors.white),
          //         ),
          //         Text(
          //           item.subTitle,
          //           style: const TextStyle(color: Colors.white70),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
