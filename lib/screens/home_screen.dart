import 'package:flutter/material.dart';
import '../widgets/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
            width: 200.0,
            height: 100.0,
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.blue, // Color must be inside BoxDecoration if decoration is present
              borderRadius: BorderRadius.circular(15.0),
            ),
          child: PrimaryButton(
          text: 'Continue',
          onPressed: () {
             print('The value of the input i');
          },
        ),
        )
      ),
    );
  }
}
