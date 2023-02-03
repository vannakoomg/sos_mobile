import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String? title;
  final String? vote;
  final String? answer;
  final List? image;
  final GestureTapCallback? ontap;
  final GestureTapCallback? onLongPress;
  final GestureTapCallback? onLongPressEnd;

  final Function? onLongPressDown;

  const QuestionCard({
    super.key,
    this.title,
    this.answer,
    this.image,
    this.vote,
    required this.ontap,
    required this.onLongPress,
    required this.onLongPressEnd,
    required this.onLongPressDown,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

bool isTap = false;

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap!();
      },
      onLongPressDown: (value) {
        widget.onLongPressDown!(value);
      },
      onLongPress: () {
        widget.onLongPress!();
      },
      onLongPressEnd: (s) {
        widget.onLongPressEnd!();
        setState(() {
          isTap = false;
        });
      },
      onLongPressMoveUpdate: (value) {
        debugPrint(
            "M [${value.globalPosition.dx} , ${value.globalPosition.dy}]");
      },
      onTapDown: (va) {
        setState(() {
          isTap = true;
        });
      },
      child: AnimatedContainer(
        padding: isTap == false
            ? const EdgeInsets.all(0)
            : const EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
        curve: Curves.ease,
        height: 310,
        decoration: BoxDecoration(
            color: Colors.transparent, borderRadius: BorderRadius.circular(20)),
        duration: const Duration(milliseconds: 80),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${widget.title}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const Spacer(),
                Text("${widget.answer}",
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
                Text("${widget.vote}",
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 17)),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 264,
              width: double.infinity,
              child: PageView.builder(
                itemBuilder: (context, page) {
                  return CachedNetworkImage(
                    imageUrl: widget.image![page],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
                itemCount: widget.image!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
