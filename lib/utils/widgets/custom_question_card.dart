import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/question/widgets/more_question_option.dart';
import 'package:sos_mobile/utils/controllers/app_controller.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';
import 'package:sos_mobile/utils/widgets/custom_highlightText.dart';

import '../../configs/const/Colors/app_colors.dart';

class CustomQuestionCard extends StatefulWidget {
  final bool isHighlight;
  final List<String> tags;
  final bool isCorrect;
  // final String time;
  final String title;
  final String descrition;
  final String image;
  final String commentCount;
  final String answerCount;
  final String likeCount;
  final Function ontapQuestion;
  final bool istall;
  final String questionId;
  final String textHighlight;

  const CustomQuestionCard({
    super.key,
    this.istall = true,
    this.isHighlight = false,
    this.descrition = '',
    this.textHighlight = '',
    required this.questionId,
    required this.isCorrect,
    required this.tags,
    // required this.time,
    required this.image,
    required this.commentCount,
    required this.title,
    required this.likeCount,
    required this.answerCount,
    required this.ontapQuestion,
  });

  @override
  State<CustomQuestionCard> createState() => _CustomQuestionCardState();
}

class _CustomQuestionCardState extends State<CustomQuestionCard>
    with SingleTickerProviderStateMixin {
  final appController = Get.put(AppController());
  TransformationController controller = TransformationController();
  AnimationController? animationController;
  Animation<Matrix4>? animation;
  OverlayEntry? empty;
  double hightImage = 0.0;
  @override
  void initState() {
    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        controller.value = animation!.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay(context);
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontapQuestion();
      },
      onLongPressStart: (value) {
        appController.onlongPressStart(
          golbalDx: value.globalPosition.dx,
          golbalDy: value.globalPosition.dy,
          widthScreen: MediaQuery.sizeOf(context).width,
          id: widget.questionId,
        );
      },
      onLongPressMoveUpdate: (value) {
        appController.onLongPressMoveUpdate(
            globalDx: value.globalPosition.dx - 22,
            globalDy: value.globalPosition.dy - 22);
      },
      onLongPressEnd: (value) {
        appController.onLongPressEnd(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
        ),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: widget.isHighlight
                              ? CustomHighlightText(
                                  context: context,
                                  text: widget.title,
                                  highlightText: widget.textHighlight,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          overflow: TextOverflow.ellipsis),
                                  highlightTextStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(

                                          // backgroundColor: Colors.blue,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          overflow: TextOverflow.ellipsis))
                              : Text(
                                  widget.title,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          overflow: TextOverflow.ellipsis),
                                )),
                      if (widget.isCorrect)
                        const Icon(
                          Icons.task_alt_rounded,
                          color: Colors.green,
                        )
                    ],
                  ),
                  // if (widget.descrition != '' && widget.image == "")
                  Text(
                    widget.descrition,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  if (widget.image != '') buildimage(),
                  // Text(
                  //   widget.time,
                  //   style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //       color: Theme.of(context).colorScheme.onPrimary),
                  // ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Wrap(
                                children: widget.tags.map((e) {
                                  return Container(
                                    height: 16,
                                    margin: const EdgeInsets.only(right: 5),
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                    ),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 231, 152, 179),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                      child: Text(
                                        "សមីការឌ៣៤៥៦៧៨",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontSize: 8),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            debugPrint(widget.questionId);
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return MoreQuesionOption(
                                  questionId: widget.questionId,
                                  image: widget.image,
                                );
                              },
                            );
                          },
                          child: const Icon(
                            Icons.more_vert_rounded,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.5,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Text(
                        widget.answerCount,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ចម្លើយ",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColor.textfourth,
                            ),
                      ),
                    ],
                  )),
                  Text(
                    widget.commentCount,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "មតិ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.textfourth),
                  ),
                  const Gap(20),
                  Text(
                    widget.likeCount,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ពេញចិត្ត",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColor.textfourth, fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void resetZoom() {
    removeOverlay(context);
    animation = Matrix4Tween(begin: controller.value, end: Matrix4.identity())
        .animate(CurvedAnimation(
            parent: animationController!, curve: Curves.easeIn));
    animationController!.forward(from: 0);
  }

  Widget buildimage() {
    return Builder(builder: (context) {
      return GestureDetector(
        onDoubleTap: () {
          resetZoom();
        },
        child: InteractiveViewer(
          transformationController: controller,
          onInteractionStart: ((details) {
            if (details.pointerCount > 1.2) {
              showOverLay(context);
            }
          }),
          minScale: 1,
          maxScale: 4,
          clipBehavior: Clip.none,
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: CustomCachedImageCircle(
              borderRadius: BorderRadius.circular(15),
              height: widget.istall
                  ? MediaQuery.sizeOf(context).height / 1.7
                  : MediaQuery.sizeOf(context).width / 2,
              width: double.infinity,
              image: widget.image,
            ),
          ),
        ),
      );
    });
  }

  void showOverLay(BuildContext context) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    empty = OverlayEntry(builder: (context) {
      return Stack(
        children: [
          GestureDetector(
            onTap: () {
              resetZoom();
            },
            onDoubleTap: () {
              resetZoom();
            },
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Positioned(
            left: offset.dx,
            top: offset.dy,
            width: size.width,
            child: buildimage(),
          ),
        ],
      );
    });
    final overlay = Overlay.of(context);
    overlay.insert(empty!);
  }

  void removeOverlay(BuildContext context) {
    if (empty != null) {
      empty!.remove();
      empty = null;
    }
  }
}
