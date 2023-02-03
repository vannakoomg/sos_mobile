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
        "http://www.sciencefriday.com/wp-content/uploads/2016/08/Artboard-1.png",
      ],
      answer: "1",
      votes: "10",
      key: GlobalKey(),
    ),
    QuestionModel(
        title: "What is Nokai",
        image: [
          "https://marvel-b1-cdn.bc0a.com/f00000000026007/resilienteducator.com/wp-content/uploads/2012/11/AdobeStock_60467600_cup.jpg",
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg"
        ],
        answer: "1",
        votes: "10",
        key: GlobalKey()),
    QuestionModel(
        title: "What is the IU",
        image: [
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://media.istockphoto.com/vectors/drawing-saying-i-love-math-with-pictures-vector-id471025938",
        ],
        answer: "10",
        votes: "0",
        key: GlobalKey()),
    QuestionModel(
        title: "What is the IU",
        image: [
          "https://www.shutterstock.com/image-vector/math-horizontal-banner-presentation-website-260nw-1859813464.jpg",
          "https://www.teahub.io/photos/full/211-2112308_hq-math-wallpapers-math-elementary.jpg",
          "https://www.teahub.io/photos/full/211-2112308_hq-math-wallpapers-math-elementary.jpg",
        ],
        answer: "3",
        votes: "500",
        key: GlobalKey()),
    QuestionModel(
        title: "What is the IU",
        image: [
          "https://t3.ftcdn.net/jpg/04/72/09/24/360_F_472092463_biXCSvYsRVE8S05Ph7LbrxglfDr66MBE.jpg",
          "https://res.cloudinary.com/dk-find-out/image/upload/q_70,c_pad,w_1200,h_630,f_auto/maths_icon_varwhq.jpg",
          "https://www.incimages.com/uploaded_files/image/1920x1080/getty_470493341_20001333200092800_398689.jpg",
        ],
        answer: "3",
        votes: "500",
        key: GlobalKey()),
  ];
  var scrollPixel = 0.0.obs;

  var oldScrollPixel = 0.0.obs;
  OverlayState? overlayState; //require
  OverlayEntry? overlayEntry; //require
  void showOverlay(BuildContext context, GlobalKey key) async {
    overlayState =
        Overlay.of(context); //require: Create state of an overlay eg. setstate
    var renderBox = key.currentContext!.findRenderObject()
        as RenderBox; //find the widget by key but as RenderBox
    Offset offset = renderBox.localToGlobal(
        Offset.zero); // compare widget position from zero (Top - Left)

    double? width = key.currentContext?.size?.width; //get widget width
    double? height = key.currentContext?.size?.height; //get widget height

    overlayEntry = OverlayEntry(
      builder: (_) {
        return Material(
          color: Colors.transparent,
          child: Stack(
            children: [
              Stack(
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.black, //background
                      BlendMode.srcOut, //require
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ///background
                        Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: const BoxDecoration(
                            color: Colors.white, //any color
                            backgroundBlendMode: BlendMode.dstOut, //require
                          ),
                        ),

                        ///Cut-out widget
                        AnimatedPositioned(
                          //normal Positioned Widget is OK : Positioned()
                          top: offset.dy,
                          left: offset.dx,
                          duration: const Duration(milliseconds: 200),
                          child: AnimatedContainer(
                            //normal Container Widget is OK : Container()
                            duration: const Duration(milliseconds: 200),
                            decoration: const BoxDecoration(
                              color: Colors.white, //any color
                              // borderRadius: BorderRadius.circular(50),
                            ),
                            width: width,
                            height: height,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    overlayState
        ?.insert(overlayEntry!); //insert overlay eg. showDialog, showOvelay
  }
}
