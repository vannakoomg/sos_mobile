import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchcontroller extends GetxController {
  final isFocus = false.obs;
  final searchTextEditController = TextEditingController().obs;
  final searchText = ''.obs;
  void delete() {
    searchText.value = '';
    searchTextEditController.value = TextEditingController();
  }

  void deleteSaveSearch() {}
}