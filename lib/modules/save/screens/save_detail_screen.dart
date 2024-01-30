import 'package:flutter/material.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

import '../widgets/option_save_category.dart';

class SaveDetailScreen extends StatefulWidget {
  final String? title;
  final String? id;
  const SaveDetailScreen({
    super.key,
    this.id,
    this.title,
  });

  @override
  State<SaveDetailScreen> createState() => _SaveDetailScreenState();
}

class _SaveDetailScreenState extends State<SaveDetailScreen> {
  @override
  void initState() {
    debugPrint("paramater ${widget.title} ${widget.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title!,
        action: IconButton(
          icon: const Icon(Icons.more_horiz_rounded, size: 35),
          onPressed: () {
            debugPrint("${widget.id}");
            showModalBottomSheet(
                barrierColor: Colors.black.withOpacity(0.2),
                context: context,
                isScrollControlled: true,
                builder: ((context) {
                  return OptionSaveCategory(
                    categoryId: widget.id!,
                    count: 1,
                  );
                }));
          },
        ),
      ),
      body: Container(),
    );
  }
}
