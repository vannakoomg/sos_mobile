import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  String? title;
  String? vote;
  String? answer;
  List? image;
  GestureTapCallback? ontap;
  GestureTapCallback? onLongPress;
  GestureTapCallback? onLongPressEnd;

  Function? onLongPressDown;

  QuestionCard({
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap!();
      },
      onLongPressDown: (value) {
        onLongPressDown!(value);
      },
      onLongPress: () {
        onLongPress!();
      },
      onLongPressEnd: (s) {
        onLongPressEnd!();
      },
      onLongPressMoveUpdate: (value) {
        debugPrint(
            "M [${value.globalPosition.dx} , ${value.globalPosition.dy}]");
      },
      onTapDown: (va) {
        debugPrint("ddd");
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(3),
        height: 304,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        duration: const Duration(milliseconds: 200),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "$title",
                  style: const TextStyle(color: Colors.white),
                ),
                const Spacer(),
                Text("$answer", style: const TextStyle(color: Colors.green)),
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 8, top: 8, left: 8, right: 8),
                  height: 15,
                  width: 0.6,
                  color: Colors.white,
                ),
                Text("$vote", style: const TextStyle(color: Colors.orange)),
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
                    imageUrl: image![page],
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    height: 264,
                    width: MediaQuery.of(context).size.height,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  );
                },
                itemCount: image!.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
