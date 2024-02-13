import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
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

Future<File> pickImage({ImageSource source = ImageSource.gallery}) async {
  var image = await picker.pickImage(source: source);
  debugPrint("iamge ${image!.path}");
  return File(image.path);
}

Future<void> saveUrlImage(String urlImage) async {
  await GallerySaver.saveImage(urlImage);
}
