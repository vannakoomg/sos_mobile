import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget action;
  final Widget leading;
  final bool isClose;
  const CustomAppBar(
      {super.key,
      this.action = const SizedBox(),
      required this.title,
      this.isClose = false,
      this.leading = const CustomBack()});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(40.0), // Adjust the height as needed
      child: AppBar(
        leadingWidth: 40,
        leading: isClose
            ? GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(Icons.close_rounded))
            : leading,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        actions: [action],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
