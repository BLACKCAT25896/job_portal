import 'dart:math' as math;

import 'package:flutter/material.dart';

class GaugePainter extends CustomPainter {
  final double value;
  final double max;

  const GaugePainter({required this.value, required this.max});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.95;
    final radius = size.width / 2 - 4;
    const startAngle = math.pi;
    const sweepAngle = math.pi;

    // Track
    final trackPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      startAngle, sweepAngle, false, trackPaint,
    );

    // Progress
    final pct = (value / max).clamp(0.0, 1.0);
    if (pct > 0) {
      final progressPaint = Paint()
        ..color = const Color(0xFF3DAE6C)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 9
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: radius),
        startAngle, sweepAngle * pct, false, progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant GaugePainter old) => old.value != value;
}
