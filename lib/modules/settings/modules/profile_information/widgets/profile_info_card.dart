import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';
import 'package:sos_mobile/utils/widgets/custom_textfield.dart';

class ProfileInfoCard extends StatelessWidget {
  final TextEditingController title;
  final Function onChanged;
  final int maxlength;
  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.onChanged,
    required this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextfield(
      textAlign: TextAlign.center,
      maxLength: maxlength,
      textStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: AppColor.textThird),
      radius: 300,
      onChanged: (value) {
        onChanged(value);
      },
      textEditController: title,
    );
  }
}
