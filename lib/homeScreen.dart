import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "nice to meet you ",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
