import 'dart:math';

import 'package:get/get.dart';

class SlashScreenController extends GetxController {
  static init() => Get.put(SlashScreenController());
  var isFetchStorgeLocal = true.obs;
  // var slashScreenModel = SlashScreenModel();
  var slashScreen = ''.obs;
  var slashScreenDataStorageLocal = [].obs;
  final listLike = <LikeModel>[].obs;
  final countTtime = true.obs;
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
