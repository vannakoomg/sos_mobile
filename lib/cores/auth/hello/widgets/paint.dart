import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class Paint01 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paintFill0 = Paint()
      ..color = AppColor.secondnaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0006000, size.height * 1.0022222);
    path_0.quadraticBezierTo(size.width * 0.1942000, size.height * 0.9300667,
        size.width * 0.2498500, size.height * 0.8514000);
    path_0.cubicTo(
        size.width * 0.3306250,
        size.height * 0.7548000,
        size.width * 0.4649000,
        size.height * 0.7448222,
        size.width * 0.5293000,
        size.height * 0.7452222);
    path_0.cubicTo(
        size.width * 0.6105500,
        size.height * 0.7380000,
        size.width * 0.7142750,
        size.height * 0.7618000,
        size.width * 0.7937000,
        size.height * 0.6861333);
    path_0.cubicTo(
        size.width * 0.8921750,
        size.height * 0.5628000,
        size.width * 0.8065937,
        size.height * 0.4670056,
        size.width * 0.7947250,
        size.height * 0.4040222);
    path_0.cubicTo(
        size.width * 0.8020500,
        size.height * 0.3394889,
        size.width * 0.9518750,
        size.height * 0.3693778,
        size.width * 0.9452500,
        size.height * 0.3226222);
    path_0.cubicTo(
        size.width * 0.9166000,
        size.height * 0.2452222,
        size.width * 0.7774250,
        size.height * 0.2407556,
        size.width * 0.8112250,
        size.height * 0.1746667);
    path_0.cubicTo(
        size.width * 0.8366000,
        size.height * 0.1418222,
        size.width * 0.8879500,
        size.height * 0.1634667,
        size.width * 0.9151500,
        size.height * 0.1295556);
    path_0.cubicTo(
        size.width * 0.9104000,
        size.height * 0.0788222,
        size.width * 0.8542250,
        size.height * 0.0560222,
        size.width * 0.8282500,
        size.height * 0.0344000);
    path_0.quadraticBezierTo(size.width * 1.0180000, size.height * 0.0274667,
        size.width * 1.0246250, size.height * -0.0299778);
    path_0.lineTo(size.width * -0.0159750, size.height * -0.0206667);
    path_0.lineTo(size.width * -0.0125750, size.height * 0.7092667);
    path_0.lineTo(size.width * 0.0006000, size.height * 1.0022222);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Paint02 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = AppColor.secondnaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0001500, size.height * 0.9977111);
    path_0.quadraticBezierTo(size.width * 0.3982750, size.height * 0.9410444,
        size.width * 0.4453000, size.height * 0.7849333);
    path_0.cubicTo(
        size.width * 0.4605750,
        size.height * 0.6687778,
        size.width * 0.5220250,
        size.height * 0.5291556,
        size.width * 0.6324750,
        size.height * 0.5013778);
    path_0.cubicTo(
        size.width * 0.7423000,
        size.height * 0.4950889,
        size.width * 0.6836750,
        size.height * 0.3424000,
        size.width * 0.8147250,
        size.height * 0.2886889);
    path_0.quadraticBezierTo(size.width * 0.9956000, size.height * 0.2235778,
        size.width * 0.9975000, size.height * -0.0105111);
    path_0.lineTo(size.width * -0.0169750, size.height * -0.0044444);
    path_0.lineTo(size.width * 0.0001500, size.height * 0.9977111);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
