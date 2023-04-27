import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final double height;
  final String hintText;
  final Function? onChanged;
  final TextInputType textInputType;
  final TextEditingController? textEditController;
  final bool autofocus;
  const CustomTextfield(
      {super.key,
      required this.hintText,
      required this.onChanged,
      required this.textEditController,
      this.textInputType = TextInputType.text,
      this.height = 50,
      this.autofocus = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        autofocus: autofocus,
        controller: textEditController,
        style: const TextStyle(color: Colors.white),
        cursorHeight: 20,
        onChanged: (value) {
          onChanged!(value);
        },
        keyboardType: textInputType,
        decoration: InputDecoration(
            counterStyle: const TextStyle(color: Colors.white),
            fillColor: Colors.white,
            focusColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(60.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(60.0),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}
