import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';
import 'package:sos_mobile/modules/home/data/Model/property_data/property_data.dart';
import 'package:sos_mobile/modules/home/data/Model/question_model/question_model.dart';
import 'package:sos_mobile/modules/home/data/repostiory/home_repository.dart';

class HomeContoller extends HomeRepository {
  final question = <QuestionModel>[
    QuestionModel(
      title: "ហេតុអ្វី​បានជានេនទំស្រលាញ់ទាវ",
      image: [
        "http://www.sciencefriday.com/wp-content/uploads/2016/08/Artboard-1.png",
      ],
      answer: "៣៤",
      votes: "១",
      key: GlobalKey(),
    ),
    QuestionModel(
        title: "អ្វីទៅជាចលនាអក្សរសិស្សះ",
        image: [
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://t3.ftcdn.net/jpg/04/83/90/18/360_F_483901821_46VsNR67uJC3xIKQN4aaxR6GtAZhx9G8.jpg",
          "https://media.istockphoto.com/vectors/drawing-saying-i-love-math-with-pictures-vector-id471025938",
        ],
        answer: "២",
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
        votes: "៥០០",
        key: GlobalKey()),
    QuestionModel(
        title: "ចលរនាត្រង់ស្មើ",
        image: [
          "https://t3.ftcdn.net/jpg/04/72/09/24/360_F_472092463_biXCSvYsRVE8S05Ph7LbrxglfDr66MBE.jpg",
          "https://res.cloudinary.com/dk-find-out/image/upload/q_70,c_pad,w_1200,h_630,f_auto/maths_icon_varwhq.jpg",
          "https://www.incimages.com/uploaded_files/image/1920x1080/getty_470493341_20001333200092800_398689.jpg",
        ],
        answer: "៨",
        votes: "២០",
        key: GlobalKey()),
  ];
  final scrollPixel = 0.0.obs;
  final isTapcard = false.obs;
  final indexPage = 1.obs;
  final oldScrollPixel = 0.0.obs;
  final isLongPress =false.obs;
  final dx = 0.0.obs;
  final dy = 0.0.obs;
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
                    colorFilter: ColorFilter.mode(
                      AppColor.backgroundColor, //background
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
  

  var currentPage = 1.obs;
  var lastPage = 2.obs;
  var isLoading=false.obs;
  var listPropertyData = <PropertyModel>[].obs;
  
}
