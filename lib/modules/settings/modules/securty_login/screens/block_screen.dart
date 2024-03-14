import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

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
            children: [
              CustomCachedImageCircle(
                image: "",
                height: 50,
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    "Vannak",
                    // style: Theme.of(context),
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
