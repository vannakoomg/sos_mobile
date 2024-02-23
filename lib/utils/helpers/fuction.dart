import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
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

Color rendomColors() {
  int i = Random().nextInt(5) + 1;
  if (i == 1) {
    return const Color.fromARGB(255, 0, 77, 96);
  } else if (i == 2) {
    return const Color(0xff023047);
  } else if (i == 2) {
    return const Color.fromARGB(255, 81, 0, 0);
  } else if (i == 2) {
    return const Color.fromARGB(255, 0, 61, 24);
  } else {
    return const Color.fromARGB(255, 91, 30, 0);
  }
}

Future<String> compressAndGetFile(File file) async {
  // final dir = Directory.systemTemp;
  // final targetPath = "${dir.absolute.path}/temp.jpg";
  var result = await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    minWidth: 2300,
    minHeight: 1500,
    quality: 94,
    rotate: 90,
  );
  var base64img = base64Encode(result!);
  return base64img;
}

FormData dataImage({String? name, String? path}) {
  FormData formData = FormData.fromMap({
    "name": name,
    "cover": MultipartFile.fromFile(
      path!,
      filename: "category_image.jpg",
    ),
  });
  return formData;
}
