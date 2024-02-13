import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final bool isBorder;
  final double high;
  final String hintText;
  final Function? onChanged;
  final Function? onValidate;
  final Widget? prefixIcon;
  final Widget? subfix;
  final TextInputType textInputType;
  final TextEditingController? textEditController;
  final bool autofocus;
  final int maxLines;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final Function? validator;
  final int? maxLength;
  final Color? color;
  final double radius;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final bool isDense;
  final bool readOnly;
  final EdgeInsets contentPadding;
  const CustomTextfield({
    super.key,
    this.contentPadding =
        const EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
    this.readOnly = false,
    required this.onChanged,
    required this.textEditController,
    this.textStyle,
    this.validator,
    this.isBorder = true,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    this.autofocus = false,
    this.focusNode,
    this.high = 0,
    this.hintTextStyle,
    this.maxLines = 1,
    this.color,
    this.onValidate,
    this.radius = 200,
    this.subfix,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.isDense = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColor.primaryColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        readOnly: readOnly,
        textAlign: textAlign,
        focusNode: focusNode,
        autofocus: autofocus,
        controller: textEditController,
        style: textStyle ??
            Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onTertiary,
                ),
        onChanged: (value) {
          onChanged!(value);
        },
        validator: (value) {
          // value.gmail;
          if (onValidate == null) {
            return null;
          } else {
            onValidate!;
            (value);
          }
          return null;
        },
        cursorColor: AppColor.secondnaryColor,
        enableSuggestions: false,
        // cursorHeight: 10,
        autocorrect: false,
        maxLength: maxLength == 0 ? null : maxLength,
        keyboardType: textInputType,
        decoration: InputDecoration(
            contentPadding: contentPadding,
            prefixIcon: prefixIcon,
            suffix: subfix,
            prefixIconConstraints: const BoxConstraints(),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            fillColor: Colors.green,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            hintText: hintText,
            counterText: "",
            isDense: isDense,
            hintStyle: hintTextStyle ??
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onTertiary,
                    )),
        maxLines: maxLines == 0 ? null : maxLines,
      ),
    );
  }
}
