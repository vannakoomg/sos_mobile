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
        answer: "1",
        votes: "10",
        key: GlobalKey()),
    QuestionModel(
        title: "What is Nokai",
        image: [
          "https://i.pinimg.com/736x/d5/cb/83/d5cb8311c9d8f7f076c0475726c4913f.jpg"
        ],
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
        answer: "10",
        votes: "0",
        key: GlobalKey()),
  ];

  var onTapQuestion = false.obs;
  var onLongPress = false.obs;
}
