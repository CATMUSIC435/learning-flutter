import 'package:flutter/material.dart';
import 'package:biex/models/home_page_model.dart';

class SliderWidget extends StatelessWidget {
  final List<SliderItem> items;

  const SliderWidget({super.key, required this.items});

  @overide
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder{
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.bluegrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment.MainAxisAlignment.center,
                children: [
                  Text(item.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.white,
                  )),
                  Text(item.subTitle,
                  style: const TextStyle(
                    color: Color.white,
                  ))
                ]
              )
            )
          );
        }
      }
    );
  }
}
