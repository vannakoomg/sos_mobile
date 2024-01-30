import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();
bool checkStringIsgmail({required String value}) {
  return RegExp(r'^[a-zA-Z0-9.]+@gmail\.com$').hasMatch(value);
}

Future unFocus(BuildContext context) async {
  final FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

Future<List> pickMultiImage() async {
  var listimage = await picker.pickMultiImage();
  return listimage;
}

Future<File> pickImage() async {
  var image = await picker.pickImage(source: ImageSource.gallery);
  debugPrint("iamge ${image!.path}");
  return File(image.path);
}
