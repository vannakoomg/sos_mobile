import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final double high;
  final String hintText;
  final Function? onChanged;
  final Widget? prefixIcon;
  final Widget? subfix;
  final TextInputType textInputType;
  final TextEditingController? textEditController;
  final bool autofocus;
  final int maxLines;
  final bool? ishaveColor;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final int? minliens;
  const CustomTextfield(
      {super.key,
      required this.onChanged,
      required this.textEditController,
      this.hintText = '',
      this.textInputType = TextInputType.text,
      this.autofocus = false,
      this.focusNode,
      this.high = 0,
      this.ishaveColor = true,
      this.maxLines = 1,
      this.subfix,
      this.maxLength,
      this.textAlign = TextAlign.start,
      this.prefixIcon,
      this.minliens});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: high == 0 ? null : high,
      padding: const EdgeInsets.only(left: 10, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ishaveColor == true ? AppColor.primaryColor : Colors.transparent,
      ),
      child: TextField(
        textAlign: textAlign,
        focusNode: focusNode,
        autofocus: autofocus,
        controller: textEditController,
        style: Theme.of(context).textTheme.bodyLarge,
        onChanged: (value) {
          onChanged!(value);
        },
        cursorColor: Colors.white,
        enableSuggestions: false,
        autocorrect: false,
        maxLength: maxLength,
        keyboardType: textInputType,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffix: subfix,
            prefixIconConstraints: const BoxConstraints(),
            border: InputBorder.none,
            counterStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintText: hintText,
            counterText: "",
            isDense: true,
            hintStyle:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 13)),
        maxLines: maxLines,
      ),
    );
  }
}
