import 'package:flutter/material.dart';
import 'dart:math';

import 'package:travel_app_bloc/app_constants/colors.dart';
import 'package:travel_app_bloc/app_constants/dimensions.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, index) {
              return Transform.rotate(
                angle: _controller.value * 5 * pi,
                child: CustomPaint(
                  painter: InfinityPainter(),
                  child: SizedBox(
                    width: Dimensions.width30 * 2,
                    height: Dimensions.height30 * 2,
                  ),
                ),
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class InfinityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    var path = Path();

    var firstCircleCenter = Offset(size.width / 4, size.height / 2);
    var secondCircleCenter = Offset(3 * size.width / 4, size.height / 2);

    path.addArc(
        Rect.fromCircle(center: firstCircleCenter, radius: size.width / 4),
        0,
        2 * pi);
    path.addArc(
        Rect.fromCircle(center: secondCircleCenter, radius: size.width / 4),
        0,
        2 * pi);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
