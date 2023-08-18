import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AppController extends GetxController {
  final isOnleft = false.obs;
  final dx = 0.0.obs;
  final dy = 0.0.obs;
  final isLongPress = false.obs;
  final afterLongPress = false.obs;
  final isPress001 = false.obs;
  final isPress002 = false.obs;
  final isPress003 = false.obs;
  final isPress01 = false.obs;
  final isPress02 = false.obs;
  final isPress03 = false.obs;
  final action = ''.obs;
  void onLongPressEnd() {
    isLongPress.value = false;
    afterLongPress.value = false;
    if (isPress01.value == true) {
      debugPrint("is press $isPress01");
    }
    isPress001.value = false;
    isPress002.value = false;
    isPress003.value = false;
    isPress01.value = false;
    isPress02.value = false;
    isPress03.value = false;
    if (action.value == "ចែករំលែក") {
      Share.share('check out my website https://example.com');
      debugPrint("okoko");
    }
    action.value = '';
  }

  void onlongPressStart(
      {required double golbalDy,
      required double golbalDx,
      required double widthScreen}) {
    isLongPress.value = true;
    if (golbalDx < widthScreen / 2) {
      isOnleft.value = true;
    } else {
      isOnleft.value = false;
    }
    dx.value = golbalDx - 25;
    dy.value = golbalDy - 25;
    Future.delayed(const Duration(milliseconds: 20), () {
      afterLongPress.value = true;
    });
  }

  void onLongPressMoveUpdate(
      {required double globalDx, required double globalDy}) {
    if (isOnleft.value
        ? globalDx > dx.value + 60 && globalDy > dy.value
        : globalDx < dx.value && globalDy > dy.value) {
      action.value = "ពេញចិត្ត";

      isPress01.value = true;
      isPress02.value = false;
      isPress03.value = false;
    } else if (isOnleft.value
        ? globalDx > dx.value + 50 && globalDy < dy.value
        : globalDx < dx.value && globalDy < dy.value) {
      action.value = "រក្សាទុក";

      isPress01.value = false;
      isPress02.value = true;
      isPress03.value = false;
    } else if (globalDy < dy.value) {
      action.value = "ចែករំលែក";

      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = true;
    } else {
      action.value = '';
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = false;
    }
  }
}
