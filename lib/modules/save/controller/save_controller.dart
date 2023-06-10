import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/Model/question_model/question_model.dart';

class SaveController extends GetxController {
  final question = <QuestionModel>[
    QuestionModel(
      title: "b sl sy ",
      image: [
        "http://www.sciencefriday.com/wp-content/uploads/2016/08/Artboard-1.png",
      ],
      answer: "៣៤",
      votes: "១",
      tag: ["សមីការឌឺក្រេទី២", "គណិតវិទ្យា"],
      key: GlobalKey(),
    ),
    QuestionModel(
      title: "ហេតុអ្វី​បានជានេនទំស្រលាញ់ទាវ",
      image: [
        "http://www.sciencefriday.com/wp-content/uploads/2016/08/Artboard-1.png",
      ],
      answer: "៣៤",
      votes: "១",
      tag: ["សមីការឌឺក្រេទី២", "គណិតវិទ្យា"],
      key: GlobalKey(),
    ),
    QuestionModel(
        title:
            "អ្វីទៅជាចលdfksdhfkhdskfhkdshfkdshfkhdsfkjhdskfhdskhksdfkdskនាអក្សរសិស្សះ",
        image: [
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://media.istockphoto.com/vectors/drawing-saying-i-love-math-with-pictures-vector-id471025938",
        ],
        answer: "២",
        tag: ["សមីការឌឺក្រេទី២", "គណិតវិទ្យា"],
        votes: "០",
        key: GlobalKey()),
    QuestionModel(
        title: "សមីការឌឺក្រឺទីពីរ",
        image: [
          "https://www.shutterstock.com/image-vector/math-horizontal-banner-presentation-website-260nw-1859813464.jpg",
          "https://www.teahub.io/photos/full/211-2112308_hq-math-wallpapers-math-elementary.jpg",
          "https://www.teahub.io/photos/full/211-2112308_hq-math-wallpapers-math-elementary.jpg",
        ],
        answer: "១",
        tag: ["សមីការឌឺក្រេទី២", "គណិតវិទ្យា"],
        votes: "៥០០",
        key: GlobalKey()),
    QuestionModel(
        title:
            "ចលរនាត្jdsjfjdslkfjlkdjflkdsjfjdslkfjlsdjfldsjlfkjdslkfjlksdjflkdsjflkjdslkfjldskfjldsjflkdsjfruoiruoweiruoewuroewiuroiwssadjflksadjfljdsflkjdsalkfjdslkfjldsjflkdsajflsadjflsajflkjdsalfkjdsjflksjlfjdsalkdfjdslfjរង់ស្មើ",
        image: [
          // "https://t3.ftcdn.net/jpg/04/72/09/24/360_F_472092463_biXCSvYsRVE8S05Ph7LbrxglfDr66MBE.jpg",
          // "https://res.cloudinary.com/dk-find-out/image/upload/q_70,c_pad,w_1200,h_630,f_auto/maths_icon_varwhq.jpg",
          // "https://www.incimages.com/uploaded_files/image/1920x1080/getty_470493341_20001333200092800_398689.jpg",
        ],
        tag: ["សមីការឌឺក្រេទី២", "គណិតវិទ្យា"],
        answer: "៨",
        votes: "២០",
        key: GlobalKey()),
  ];
}
