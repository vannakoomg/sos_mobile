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
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final int? maxLength;
  final Color? color;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  const CustomTextfield({
    super.key,
    required this.onChanged,
    required this.textEditController,
    this.textStyle,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    this.autofocus = false,
    this.focusNode,
    this.high = 0,
    this.hintTextStyle,
    this.maxLines = 1,
    this.color,
    this.subfix,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: high == 0 ? null : high,
      padding: const EdgeInsets.only(left: 10, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color ?? AppColor.primaryColor.withOpacity(1),
      ),
      child: TextField(
        textAlign: textAlign,
        focusNode: focusNode,
        autofocus: autofocus,
        controller: textEditController,
        style: textStyle ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColor.mainColor.withOpacity(0.7)),
        onChanged: (value) {
          onChanged!(value);
        },
        cursorColor: AppColor.secondnaryColor,
        enableSuggestions: false,
        autocorrect: false,
        maxLength: maxLength == 0 ? null : maxLength,
        keyboardType: textInputType,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffix: subfix,
            prefixIconConstraints: const BoxConstraints(),
            border: InputBorder.none,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hintText: hintText,
            counterText: "",
            isDense: true,
            hintStyle: hintTextStyle ??
                Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.mainColor.withOpacity(0.5))),
        maxLines: maxLines == 0 ? null : maxLines,
      ),
    );
  }
}
