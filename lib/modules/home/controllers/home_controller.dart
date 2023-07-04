import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class HomeContoller extends GetxController {
  final question = [];
  final isTapcard = false.obs;
  final indexPage = 1.obs;
  final isLongPress = false.obs;
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

  final scrollPixel = 0.0.obs;
  final oldScrollPixel = 0.0.obs;
  final oldScrollback = 0.0.obs;
  final scrollPixalBack = 0.0.obs;
  var currentPage = 1.obs;
  var lastPage = 2.obs;
  var isLoading = false.obs;
  var listPropertyData = ''.obs;
  final isForYou = true.obs;
  final isMovePage = true.obs;
}
