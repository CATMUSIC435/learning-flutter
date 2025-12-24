  import 'package:flutter/material.dart';
import 'package:biex/pages/home_page.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const App());
}
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
 }