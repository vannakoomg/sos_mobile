import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String? hintText;
  Function? onChanged;
  CustomTextfield({super.key, this.hintText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextFormField(
        cursorHeight: 20,
        onChanged: (value) {
          onChanged!(value);
        },
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
            hintText: hintText ?? '',
            hintStyle: const TextStyle(color: Colors.white, fontSize: 14)),
      ),
    );
  }
}
