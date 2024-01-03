// import 'package:flutter/material.dart';
// import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

// class CustomAvatar extends StatelessWidget {
//   final String defaultImage;
//   final Function ontap;
//   final Colors borderColor;
//   final String image;
//   const CustomAvatar(
//       {super.key,
//       required this.defaultImage,
//       required this.ontap,
//       required this.borderColor,
//       required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 120,
//           width: 120,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: AppColor.primaryColor, width: 3),
//             color: AppColor.secondnaryColor,
//           ),
//           child: _profileController.imagePath.value.path == ''
//               ? Center(
//                   child: Text(_profileController
//                       .profileDate.value.data!.fullNameKh![0]),
//                 )
//               : Image.network(""),
//         ));
//   }
// }
