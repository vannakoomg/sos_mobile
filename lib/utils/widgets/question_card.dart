import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/presentation/logic/home_controller.dart';

class QuestionCard extends StatelessWidget {
  final String? title;
  final String? vote;
  final String? answer;
  final List? image;
  final int? indexPage;
  final GestureTapCallback? ontap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onLongPressEnd;

  final Function? onLongPressStart;
  const QuestionCard({
    super.key,
    this.title,
    this.answer,
    this.image,
    this.vote,
    this.indexPage,
    required this.ontap,
    required this.onLongPress,
    required this.onLongPressEnd,
    required this.onLongPressStart,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeContoller());
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      onLongPress: () {
        onLongPress!();
      },
      onLongPressStart: (value) {
        onLongPressStart!(value);
      },
      onLongPressEnd: (s) {
        onLongPressEnd!();

        controller.isTapcard.value = false;
      },
      onLongPressMoveUpdate: (value) {
        debugPrint(
            "M [${value.globalPosition.dx} , ${value.globalPosition.dy}]");
      },
      onTapDown: (va) {
        controller.isTapcard.value = true;
      },
      child: image!.isEmpty
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                height: 50,
                // margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$title",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    const Spacer(),
                    Text("$answer",
                        style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 17)),
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 8, top: 8, left: 8, right: 8),
                      height: 22,
                      width: 0.6,
                      color: Colors.white,
                    ),
                    Text("$vote",
                        style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                            fontSize: 17)),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            )
          : AnimatedContainer(
              margin: const EdgeInsets.only(bottom: 20),
              // padding: controller.isTapcard.value == false
              //     ? const EdgeInsets.all(0)
              //     : const EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
              curve: Curves.ease,
              height: 410,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(0)),
              duration: const Duration(milliseconds: 80),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "$title",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const Spacer(),
                      Text("$answer",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 17)),
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 8, top: 8, left: 8, right: 8),
                        height: 22,
                        width: 0.6,
                        color: Colors.white,
                      ),
                      Text("$vote",
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 17)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: 364,
                        width: double.infinity,
                        child: PageView.builder(
                          itemBuilder: (context, page) {
                            return CachedNetworkImage(
                              imageUrl: image![page],
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              height: 264,
                              width: MediaQuery.of(context).size.height,
                              placeholder: (context, url) => Container(
                                height: 264,
                                color: Colors.red,
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            );
                          },
                          itemCount: image!.length,
                          onPageChanged: (index) {
                            controller.indexPage.value = index + 1;
                          },
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "${image!.length}",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
