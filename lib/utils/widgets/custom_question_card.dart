import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
// import 'package:sos_mobile/modules/profile/models/profile_model.dart';

import '../../modules/home/Model/home_model.dart';
import 'custom_tag_card.dart';

class QuestionCard extends StatelessWidget {
  final Data? questiondata;
  final GestureTapCallback? ontap;
  const QuestionCard({
    super.key,
    this.questiondata,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          ontap!();
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.primaryColor,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${questiondata!.title}",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: questiondata!.tags!.map((e) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: CustomTagCard(
                              title: e,
                              ontap: () {},
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text("${questiondata!.amountAnswers}",
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 17)),
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 8, top: 8, left: 8, right: 8),
                    height: 22,
                    width: 0.6,
                  ),
                  const Text(
                    "0",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        )

        //  AnimatedContainer(
        //     margin: const EdgeInsets.only(bottom: 10),
        //     padding: const EdgeInsets.only(bottom: 15, top: 15),
        //     curve: Curves.ease,
        //     decoration: BoxDecoration(
        //         color: AppColor.primaryColor,
        //         borderRadius: BorderRadius.circular(15)),
        //     duration: const Duration(milliseconds: 80),
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10, right: 10),
        //           child: Row(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Expanded(
        //                 child: Text(
        //                   "$title",
        //                   style: Theme.of(context).textTheme.titleSmall,
        //                   overflow: TextOverflow.ellipsis,
        //                   maxLines: 2,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 10,
        //               ),
        //             ],
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 5,
        //         ),
        //         Stack(
        //           children: [
        //             SizedBox(
        //               height: 350,
        //               width: double.infinity,
        //               child: PageView.builder(
        //                 itemBuilder: (context, page) {
        //                   return CachedNetworkImage(
        //                     imageUrl: image![page],
        //                     fit: BoxFit.cover,
        //                     width: MediaQuery.of(context).size.height,
        //                     placeholder: (context, url) => Container(
        //                       color: Colors.red,
        //                     ),
        //                     errorWidget: (context, url, error) =>
        //                         const Icon(Icons.error),
        //                   );
        //                 },
        //                 itemCount: image!.length,
        //                 onPageChanged: (index) {
        //                   controller.indexPage.value = index + 1;
        //                 },
        //               ),
        //             ),
        //             Positioned(
        //               left: 20,
        //               bottom: 10,
        //               child: Container(
        //                 padding: const EdgeInsets.only(
        //                     left: 10, right: 10, top: 2, bottom: 2),
        //                 decoration: BoxDecoration(
        //                   borderRadius: BorderRadius.circular(15),
        //                 ),
        //                 child: Row(
        //                   children: [
        //                     Text(
        //                       "${image!.length}",
        //                       style: Theme.of(context).textTheme.bodySmall,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Expanded(
        //               child: Padding(
        //                 padding: const EdgeInsets.only(left: 10, top: 10),
        //                 child: SingleChildScrollView(
        //                   scrollDirection: Axis.horizontal,
        //                   child: Row(
        //                     children: tag.map((e) {
        //                       return Padding(
        //                         padding: const EdgeInsets.only(right: 5),
        //                         child: CustomTagCard(
        //                           title: e,
        //                           ontap: () {},
        //                         ),
        //                       );
        //                     }).toList(),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //             Text("$answer",
        //                 style: const TextStyle(
        //                     color: Colors.green,
        //                     fontWeight: FontWeight.w600,
        //                     fontSize: 17)),
        //             Container(
        //               margin: const EdgeInsets.only(
        //                   bottom: 8, top: 8, left: 8, right: 8),
        //               height: 22,
        //               width: 0.6,
        //               color: Colors.white,
        //             ),
        //             Text(
        //               "$vote",
        //               style: const TextStyle(
        //                   color: Colors.orange,
        //                   fontWeight: FontWeight.w600,
        //                   fontSize: 17),
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             )
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),

        );
  }
}
