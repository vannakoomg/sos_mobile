import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sos_mobile/modules/report/screens/report_type_screen.dart';

import '../../modules/cateory/screens/save_question_screen.dart';

class AppController extends GetxController {
  final questionId = ''.obs;
  final isOnleft = false.obs;
  final dx = 0.0.obs;
  final dy = 0.0.obs;
  final isLongPress = false.obs;
  final afterLongPress = false.obs;
  final isPress01 = false.obs;
  final isPress02 = false.obs;
  final isPress03 = false.obs;
  final isPress04 = false.obs;
  final action = 0.obs;
  void onLongPressEnd(BuildContext context) {
    isLongPress.value = false;
    afterLongPress.value = false;
    isPress01.value = false;
    isPress02.value = false;
    isPress03.value = false;
    isPress04.value = false;
    if (action.value == 3) {
      Share.share('check out my website https://example.com');
    }
    if (action.value == 2) {
      Future.delayed(const Duration(milliseconds: 200), () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: ((context) {
              return CreateSave(
                questionId: questionId.value,
              );
            }));
      });
    }
    if (action.value == 4) {
      Future.delayed(const Duration(milliseconds: 200), () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            builder: ((context) {
              return const ReportTypeScreen();
            }));
      });
    }
    action.value = 0;
  }

  void onlongPressStart(
      {required double golbalDy,
      required double golbalDx,
      required double widthScreen,
      required String id}) {
    questionId.value = id;
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
      action.value = 1;
      isPress01.value = true;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value - 80 && globalDx < dx.value + 80) &&
            (globalDy < dy.value - 40 && globalDy > dy.value - 100)
        : (globalDx < dx.value - 10 && globalDx > dx.value - 80) &&
            (globalDy < dy.value - 40 && globalDy > dy.value - 100)) {
      action.value = 2;
      isPress01.value = false;
      isPress02.value = true;
      isPress03.value = false;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value + 40 && globalDx < dx.value + 120) &&
            (globalDy < dy.value - 10 && globalDy > dy.value - 60)
        : (globalDx < dx.value - 40 && globalDx > dx.value - 120) &&
            (globalDy < dy.value - 15 && globalDy > dy.value - 80)) {
      action.value = 3;
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = true;
      isPress04.value = false;
    } else if (isOnleft.value
        ? (globalDx > dx.value + 40 && globalDx < dx.value + 120) &&
            (globalDy > dy.value + 0 && globalDy < dy.value + 45)
        : (globalDx < dx.value - 40 && globalDx > dx.value - 120) &&
            (globalDy > dy.value - 10 && globalDy < dy.value + 40)) {
      action.value = 4;
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = true;
    } else {
      action.value = 0;
      isPress01.value = false;
      isPress02.value = false;
      isPress03.value = false;
      isPress04.value = false;
    }
  }

  // like ui
  final listLike = <LikeModel>[].obs;
  void addListLike(double dx, double dy) {
    listLike.add(
      LikeModel(
        id: listLike.length + 1,
        dx: dx - 60,
        dy: dy - 40,
        angle: getAngle(),
        remove: false,
      ),
    );
    listLike.refresh();
    Future.delayed(const Duration(milliseconds: 10), () async {
      listLike[listLike.length - 1].remove = true;
      listLike.refresh();
    });
  }

  double getAngle() {
    int i = Random().nextInt(5);
    if (i == 0) {
      return -0.8;
    }
    if (i == 1) {
      return -0.9;
    }
    if (i == 2) {
      return 0;
    }
    if (i == 3) {
      return 0.1;
    }
    return 0.2;
  }
}

class LikeModel {
  int? id;
  double? dx;
  double? dy;
  double? angle;
  bool? remove;

  LikeModel({this.id, this.dx, this.dy, this.angle, this.remove});
}
