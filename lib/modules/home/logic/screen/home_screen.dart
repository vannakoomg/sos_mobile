import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("nice to meeet you ")),
      body: Container(
        child: Center(child: Text("Home Screen ")),
      ),
    );
  }
}
