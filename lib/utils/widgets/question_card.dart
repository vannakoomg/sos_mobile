import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final String title;
  final String description;
  final List image;
  final String answer;
  final String votes;
  const QuestionCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.answer,
    required this.votes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.mainColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(
            height: 10,
          ),
          if (image.length == 1)
            Container(
              width: MediaQuery.of(context).size.width / 2 - 40,
              height: 240,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.mainColor,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(image[0]),
                    fit: BoxFit.cover,
                  )),
            ),
          if (image.length >= 2)
            Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.mainColor,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(image[0]),
                            fit: BoxFit.cover,
                          )),
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Container(
                      height: 240,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.mainColor,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(image[1]),
                            fit: BoxFit.cover,
                          )),
                    )),
                  ],
                ),
                if (image.length > 2)
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 240,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor.withOpacity(0.2),
                      ),
                      child: Center(child: Text("+${image.length - 2}")),
                    ),
                  )
              ],
            ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: image.isNotEmpty ? 10 : 0,
            ),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: AppColor.mainColor, width: 1.1))),
            child: Column(
              children: [
                Text(description),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 20,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff1EA133),
                        border: Border.all(
                          color: AppColor.mainColor,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "$answer answer",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE9853D),
                        border: Border.all(
                          color: AppColor.mainColor,
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "$votes votes",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
