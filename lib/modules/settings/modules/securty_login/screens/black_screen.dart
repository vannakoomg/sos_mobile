import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Block"),
      body: Column(children: [
        Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            children: [],
          ),
        )
      ]),
    );
  }
}
