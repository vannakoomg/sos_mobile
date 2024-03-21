import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/custom_textfield.dart';
import '../../controllers/home_controller.dart';

class SaerchTextFile extends StatelessWidget {
  final FocusNode myfocus;
  const SaerchTextFile({super.key, required this.myfocus});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());

    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.onPageChanged();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 5),
          height: 35,
          curve: Curves.ease,
          width: controller.isForYou.value == false
              ? MediaQuery.of(context).size.width
              : 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: !controller.isForYou.value
                ? Theme.of(context).colorScheme.onTertiary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                left: controller.isForYou.value ? 0 : -90,
                child: AnimatedOpacity(
                  opacity: controller.isForYou.value ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                      margin: const EdgeInsets.only(
                        left: 2,
                        right: 2,
                      ),
                      height: 34,
                      width: 70,
                      child: Center(
                        child: Text(
                          "សំរាប់អ្នក",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      )),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 400),
                left: controller.isForYou.value ? 80 : 5,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 4, right: 4),
                      child: AnimatedContainer(
                        curve: Curves.easeInCirc,
                        duration: Duration(
                            milliseconds:
                                !controller.isForYou.value ? 800 : 500),
                        child: Icon(
                          Icons.search_rounded,
                          color: Theme.of(context).colorScheme.tertiary,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      width: controller.searchText.value != ''
                          ? MediaQuery.of(context).size.width - 80
                          : MediaQuery.of(context).size.width,
                      child: AnimatedOpacity(
                        opacity: controller.isForYou.value ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: CustomTextfield(
                          contentPadding: const EdgeInsets.only(
                            left: 4,
                          ),
                          isBorder: false,
                          focusNode: myfocus,
                          hintText: "ស្វែងរក",
                          textStyle: Theme.of(context).textTheme.bodyLarge!,
                          hintTextStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.tertiary),
                          color: Colors.transparent,
                          onChanged: (value) {
                            controller.searchText.value = value;
                            debugPrint(controller.searchText.value);
                          },
                          textEditController:
                              controller.searchTextEditController.value,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.clearSearch();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
