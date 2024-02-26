import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sos_mobile/utils/widgets/custom_cache_image_cricle.dart';

import '../../configs/const/Colors/app_colors.dart';

class CsutomQuestionCard extends StatefulWidget {
  final List<String> tags;
  final bool isCorrect;
  final String time;
  final String title;
  final String descrition;
  final String image;
  final String commentCount;
  final String answerCount;
  final String likeCount;
  final Function ontapQuestion;
  final bool istall;
  final bool isSmall;

  const CsutomQuestionCard({
    super.key,
    this.istall = true,
    this.isSmall = false,
    required this.isCorrect,
    required this.tags,
    required this.time,
    required this.image,
    required this.commentCount,
    required this.title,
    required this.likeCount,
    required this.answerCount,
    required this.ontapQuestion,
    this.descrition = '',
  });

  @override
  State<CsutomQuestionCard> createState() => _CsutomQuestionCardState();
}

class _CsutomQuestionCardState extends State<CsutomQuestionCard> {
  GlobalKey globalKey = GlobalKey();
  double hightImage = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          hightImage = globalKey.currentContext!.size!.height;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontapQuestion();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 3,
        ),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onTertiary,
          border: Border.all(width: 0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //check is show card small or big
            widget.isSmall == false
                ? Padding(
                    key: globalKey,
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              widget.title,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
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
                        Text(
                          widget.time,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                        if (widget.descrition != '' && widget.image == "")
                          Text(
                            widget.descrition,
                            maxLines: widget.image == "" ? 6 : 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColor.textfourth, fontSize: 11),
                          ),
                        if (widget.image != '')
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: CustomCachedImageCircle(
                              borderRadius: BorderRadius.circular(0),
                              height: widget.istall
                                  ? MediaQuery.sizeOf(context).height / 1.7
                                  : MediaQuery.sizeOf(context).width / 2,
                              width: double.infinity,
                              image: widget.image,
                            ),
                          ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 8),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.tags.map((e) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 2.5),
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 4, bottom: 2, top: 2),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 230, 74, 126),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Text(
                                      "សមីការឌ៣៤៥៦៧៨",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColor.primaryColor,
                                              fontSize: 8),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            height: hightImage <
                                    MediaQuery.sizeOf(context).width * 0.3
                                ? MediaQuery.sizeOf(context).width * 0.3 + 10
                                : hightImage + 5,
                            key: globalKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            widget.title,
                                            overflow: widget.descrition == ""
                                                ? null
                                                : TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onTertiary),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (widget.descrition != "")
                                      Text(
                                        widget.descrition,
                                        maxLines: 8,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                color: AppColor.textfourth,
                                                fontSize: 11),
                                      ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.time,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColor.textfourth,
                                              fontSize: 9),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(top: 5),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: widget.tags.map((e) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  right: 2.5),
                                              padding: const EdgeInsets.only(
                                                  left: 4,
                                                  right: 4,
                                                  bottom: 2,
                                                  top: 2),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 230, 74, 126),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "សមីការឌ៣៤៥៦៧៨",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: AppColor
                                                              .primaryColor,
                                                          fontSize: 8),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(5),
                        if (widget.image != '')
                          Expanded(
                            flex: 2,
                            child: CustomCachedImageCircle(
                              borderRadius: BorderRadius.circular(0),
                              height: MediaQuery.sizeOf(context).width * (0.3),
                              width: double.infinity,
                              image: widget.image,
                            ),
                          )
                      ],
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(bottom: 6, top: 8),
              height: 0.3,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
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
}
