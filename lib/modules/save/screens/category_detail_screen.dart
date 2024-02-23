import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/save/controller/category_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_appbar.dart';

import '../widgets/option_save_category.dart';

class SaveDetailScreen extends StatefulWidget {
  final String? id;
  const SaveDetailScreen({
    super.key,
    this.id,
  });

  @override
  State<SaveDetailScreen> createState() => _SaveDetailScreenState();
}

class _SaveDetailScreenState extends State<SaveDetailScreen> {
  final controller = Get.put(SaveCategoryController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: CustomAppBar(
            title: controller.title.value,
            action: IconButton(
              icon: const Icon(Icons.more_horiz_rounded, size: 35),
              onPressed: () {
                showModalBottomSheet(
                    barrierColor: Colors.black.withOpacity(0.2),
                    context: context,
                    useSafeArea: true,
                    isScrollControlled: true,
                    builder: ((context) {
                      return OptionSaveCategory(
                        categoryId: widget.id ?? '',
                        count: 1,
                        id: widget.id ?? "",
                      );
                    }));
              },
            ),
          ),
          body: Container(),
        ));
  }
}
