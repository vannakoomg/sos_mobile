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

class Paint04 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = AppColor.secondnaryColor.withOpacity(0.7)
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

class Paint03 extends CustomPainter {
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
    path_0.moveTo(size.width * -0.0022000, size.height * 1.0041778);
    path_0.cubicTo(
        size.width * 0.6412062,
        size.height * 0.9227778,
        size.width * 0.6969750,
        size.height * 1.0203111,
        size.width * 0.8556750,
        size.height * 0.8956444);
    path_0.cubicTo(
        size.width * 1.0069250,
        size.height * 0.7748222,
        size.width * 0.7419500,
        size.height * 0.4814222,
        size.width * 0.8471250,
        size.height * 0.4166444);
    path_0.quadraticBezierTo(size.width * 0.9811000, size.height * 0.3659111,
        size.width * 0.9999250, size.height * -0.0062000);
    path_0.quadraticBezierTo(size.width * 0.2863500, size.height * -0.0375111,
        0, size.height * -0.0019556);
    path_0.cubicTo(
        size.width * -0.0126750,
        size.height * 0.2021556,
        size.width * -0.0514750,
        size.height * 0.2452667,
        size.width * -0.0022000,
        size.height * 1.0041778);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Paint05 extends CustomPainter {
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
    path_0.moveTo(size.width * 0.0004500, size.height * 1.0062727);
    path_0.quadraticBezierTo(size.width * 0.3888500, size.height * 0.9834773,
        size.width * 0.4601250, size.height * 0.9031136);
    path_0.cubicTo(
        size.width * 0.5262250,
        size.height * 0.7810909,
        size.width * 0.3407250,
        size.height * 0.6665909,
        size.width * 0.3219500,
        size.height * 0.6112727);
    path_0.quadraticBezierTo(size.width * 0.3064250, size.height * 0.5188182,
        size.width * 0.5241750, size.height * 0.6052045);
    path_0.quadraticBezierTo(size.width * 0.8210000, size.height * 0.7315000,
        size.width * 0.8949000, size.height * 0.6376591);
    path_0.quadraticBezierTo(size.width * 0.9628250, size.height * 0.5407045,
        size.width * 0.7446250, size.height * 0.3600682);
    path_0.quadraticBezierTo(size.width * 0.9482750, size.height * 0.2862500,
        size.width * 0.8860000, size.height * 0.1639091);
    path_0.quadraticBezierTo(size.width * 0.8488750, size.height * 0.0348864,
        size.width * 1.0018500, size.height * -0.0038636);
    path_0.lineTo(size.width * -0.0145500, size.height * -0.0070227);
    path_0.lineTo(size.width * 0.0004500, size.height * 1.0062727);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Paint06 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paintFill0 = Paint()
      ..color = AppColor.mainColor
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0063500, size.height * 0.9969091);
    path_0.quadraticBezierTo(size.width * 0.2100250, size.height * 0.9592273,
        size.width * 0.2872500, size.height * 0.8369091);
    path_0.cubicTo(
        size.width * 0.3515000,
        size.height * 0.7035909,
        size.width * 0.1489750,
        size.height * 0.5267955,
        size.width * 0.2677750,
        size.height * 0.3830000);
    path_0.cubicTo(
        size.width * 0.3763000,
        size.height * 0.2959318,
        size.width * 0.4090750,
        size.height * 0.4822500,
        size.width * 0.5540000,
        size.height * 0.6498182);
    path_0.cubicTo(
        size.width * 0.6165500,
        size.height * 0.7271591,
        size.width * 0.7216500,
        size.height * 0.7336136,
        size.width * 0.6999250,
        size.height * 0.6087045);
    path_0.cubicTo(
        size.width * 0.6443500,
        size.height * 0.4197955,
        size.width * 0.5095500,
        size.height * 0.2745682,
        size.width * 0.6158500,
        size.height * 0.2036136);
    path_0.cubicTo(
        size.width * 0.7011750,
        size.height * 0.1882500,
        size.width * 0.7384750,
        size.height * 0.3845909,
        size.width * 0.8650250,
        size.height * 0.3097045);
    path_0.quadraticBezierTo(size.width * 0.9794000, size.height * 0.2003182,
        size.width * 0.9999250, size.height * -0.0077273);
    path_0.lineTo(size.width * 1.0001500, size.height * 1.0064773);
    path_0.lineTo(size.width * -0.0063500, size.height * 0.9969091);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
