import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final Function? onChanged;
  final TextInputType textInputType;
  final TextEditingController? textEditController;
  final bool autofocus;
  final int maxLines;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.textEditController,
      this.textInputType = TextInputType.text,
      this.autofocus = false,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.primaryColor,
      ),
      child: TextField(
        autofocus: autofocus,
        controller: textEditController,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          onChanged!(value);
        },
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: textInputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            counterStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black, fontSize: 14)),
        maxLines: maxLines,
      ),
    );
  }
}
