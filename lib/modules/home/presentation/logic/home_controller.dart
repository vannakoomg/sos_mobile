import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/modules/home/data/Model/question_model/question_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeContoller extends GetxController {
  @factoryMethod
  static init() => Get.put(HomeContoller());
  var question = <QuestionModel>[
    QuestionModel(
        title: "What is mother of Tom",
        image: [
          "https://i.discogs.com/YCopd9B5j4KEu0_mA-L8GirzXpRoHKAFJjDEkntsRTM/rs:fit/g:sm/q:90/h:600/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9BLTIyMjYz/MDYtMTU5NzMzMjM5/Mi03MzMwLmpwZWc.jpeg",
        ],
        description: "okia.com/phones website is operated by HMD Global Oy",
        answer: "1",
        votes: "10",
        key: GlobalKey()),
    QuestionModel(
        title: "What is Nokai",
        image: [],
        description:
            "Nokia.com/phones website is operated by HMD Global Oy, the exclusive licensee of the Nokia brand for phones and tablets. We use cookies and similar technologies to improve and personalize your experience and to display ads. By clicking, you agree to the use of cookies and similar technologies. You can change your settings at any time by selecting at the bottom of the site. Learn more about our",
        answer: "1",
        votes: "10",
        key: GlobalKey()),
    QuestionModel(
        title: "What is the IU",
        image: [
          "https://hashtaglegend.com/wp-content/uploads/2022/05/fullsizephoto1073124-edited.jpg",
          "https://lh3.googleusercontent.com/ko-8mYfcfSnchhRooI2uiffFX3AuDOkrP2IP5pjsarK5euObVCUu26W5vQPhfwM-nL3XKJDHVnBroiOHgV45DjuZZrHb6KAQzw=w960-rj-nu-e365",
          "https://data.whicdn.com/images/326957173/original.jpg",
        ],
        description:
            "Nokia.com/phones website is operated by HMD Global Oy, the exclusive licensee of the Nokia brand for phones and tablets. We use cookies and similar technologies to improve and personalize your experience and to display ads. By clicking, you agree to the use of cookies and similar technologies. You can change your settings at any time by selecting at the bottom of the site. Learn more about our",
        answer: "10",
        votes: "",
        key: GlobalKey()),
  ];

  var onTapQuestion = false.obs;
  var onLongPress = false.obs;
}
