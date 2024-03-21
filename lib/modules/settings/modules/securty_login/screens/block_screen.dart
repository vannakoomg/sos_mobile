import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';
import 'package:sos_mobile/utils/widgets/custom_shhh.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Block"),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 50,
          child: Row(
            children: [
              const CustomCachedImageCircle(
                image:
                    "https://api.baskadia.com/static/page/29284/3ebd6bdf-a105-4e41-8635-59ac86d382a0.xs.jpg",
                height: 50,
                width: 50,
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Vannadaljfsjdflkjsajfsfk",
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                      ),
                    ),
                    Text(
                      "3day aga",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  customShowModalBottomSheet(
                    context: context,
                    height: 100,
                    widget: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ដោះសោ",
                            style: Theme.of(context).textTheme.titleLarge!,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.more_horiz_rounded),
              )
            ],
          ),
        )
      ]),
    );
  }
}
