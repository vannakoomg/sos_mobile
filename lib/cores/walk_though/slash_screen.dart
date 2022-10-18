import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/app_colors.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        child: Center(child: Text("nice to meet ")),
      ),
    );
  }
}
