import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class AppController extends GetxController {
  final isOnleft = false.obs;
  final dx = 0.0.obs;
  final dy = 0.0.obs;
  final isLongPress = false.obs;
  final afterLongPress = false.obs;
  final isPress01 = false.obs;
  final isPress02 = false.obs;
  final isPress03 = false.obs;
  final isPress04 = false.obs;
  final action = ''.obs;
  void onLongPressEnd() {
    isLongPress.value = false;
    afterLongPress.value = false;
    isPress01.value = false;
    isPress02.value = false;
    isPress03.value = false;
    isPress04.value = false;
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
    debugPrint("$globalDx , ${dx.value}");
    if (isOnleft.value
        ? (globalDx > dx.value - 40 && globalDx < dx.value + 20) &&
            (globalDy < dy.value - 50 && globalDy > dy.value - 120)
        : (globalDx < dx.value + 50 && globalDx > dx.value - 20) &&
            (globalDy < dy.value - 50 && globalDy > dy.value - 120)) {
      action.value = "ពេញចិត្ត";
      isPress01.value = true;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value - 80 && globalDx < dx.value + 80) &&
            (globalDy < dy.value - 40 && globalDy > dy.value - 100)
        : (globalDx < dx.value - 10 && globalDx > dx.value - 80) &&
            (globalDy < dy.value - 40 && globalDy > dy.value - 100)) {
      action.value = "រក្សាទុក";
      isPress01.value = false;
      isPress02.value = true;
      isPress03.value = false;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value + 40 && globalDx < dx.value + 120) &&
            (globalDy < dy.value - 10 && globalDy > dy.value - 60)
        : (globalDx < dx.value - 40 && globalDx > dx.value - 120) &&
            (globalDy < dy.value - 15 && globalDy > dy.value - 80)) {
      action.value = "ចែករំលែក";
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = true;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value + 40 && globalDx < dx.value + 120) &&
            (globalDy > dy.value + 0 && globalDy < dy.value + 45)
        : (globalDx < dx.value - 40 && globalDx > dx.value - 120) &&
            (globalDy > dy.value - 10 && globalDy < dy.value + 40)) {
      action.value = "ព្រមាន";
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = true;
    } else {
      action.value = '';
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = false;
    }
  }
}
