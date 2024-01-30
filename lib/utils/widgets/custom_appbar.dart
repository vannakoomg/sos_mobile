import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_back.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget action;
  const CustomAppBar(
      {super.key, this.action = const SizedBox(), required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0), // Adjust the height as needed
      child: AppBar(
        leading: const CustomBack(),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [action],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
