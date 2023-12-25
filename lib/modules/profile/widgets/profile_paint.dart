import 'package:flutter/material.dart';
import 'package:sos_mobile/configs/const/Colors/app_colors.dart';

class Coverpaint extends CustomPainter {
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
    path_0.moveTo(size.width * -0.0008500, size.height * 1.0025111);
    path_0.quadraticBezierTo(size.width * 0.1701500, size.height * 0.7643333,
        size.width * 0.2904000, size.height * 0.7669333);
    path_0.cubicTo(
        size.width * 0.3488500,
        size.height * 0.7626444,
        size.width * 0.5110333,
        size.height * 0.9018667,
        size.width * 0.5572833,
        size.height * 0.8920000);
    path_0.cubicTo(
        size.width * 0.6737667,
        size.height * 0.8778444,
        size.width * 0.5908667,
        size.height * 0.4901778,
        size.width * 0.6587500,
        size.height * 0.4407111);
    path_0.cubicTo(
        size.width * 0.7278500,
        size.height * 0.3799556,
        size.width * 0.8534667,
        size.height * 0.4494889,
        size.width * 0.9095667,
        size.height * 0.3722222);
    path_0.quadraticBezierTo(size.width * 0.9998333, size.height * 0.2398889,
        size.width * 0.9975667, size.height * -0.0002667);
    path_0.lineTo(size.width * 0.0026500, size.height * 0.0019778);
    path_0.lineTo(size.width * -0.0008500, size.height * 1.0025111);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
