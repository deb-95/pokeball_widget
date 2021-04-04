import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

/// Paint class to wrap pokeball painter.
/// Receives a [Color] and a [double] opacity to be passed down to PokeBallPainter
class PokeBallPaint extends CustomPaint {
  final Color color;
  final double opacity;

  const PokeBallPaint(
      {Key key,
      @required this.color,
      this.opacity,
      CustomPainter foregroundPainter,
      Size size = Size.zero,
      bool isComplex = false,
      bool willChange = false,
      Widget child})
      : super(
          key: key,
          foregroundPainter: foregroundPainter,
          size: size,
          isComplex: isComplex,
          willChange: willChange,
          child: child,
        );
}

/// Painter for the pokeball shape.
/// Receives a [Color] as a parameter to be used for the shape fill color.
/// [double] opacity to set the shape opacity
class PokeBallPainter extends CustomPainter {
  final Color color;
  final double opacity;

  PokeBallPainter({@required this.color, this.opacity = 0.5});

  @override
  void paint(Canvas canvas, Size size) {
    final minSize = min<num>(size.width, size.height);
    final centerOffset = Offset(size.width / 2, size.height / 2);
    final mainPaint = Paint()..color = color.withOpacity(opacity);
    final padding = minSize / 20;
    final strokeWidth = minSize / 13;
    final linePaintToRemove = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..blendMode = BlendMode.dstOut;
    final circlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..blendMode = BlendMode.dstOut;
    final centerCircleRadius = minSize / 8;

    canvas.saveLayer(
        Rect.fromCenter(center: centerOffset, width: minSize, height: minSize),
        Paint());
    // Draw the outside circle
    canvas.drawCircle(centerOffset, minSize / 2, mainPaint);
    // Draw the parts to remove
    canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width / 2 - centerCircleRadius - padding, size.height / 2),
        linePaintToRemove);
    canvas.drawLine(
        Offset(size.width / 2 + centerCircleRadius + padding, size.height / 2),
        Offset(size.width, size.height / 2),
        linePaintToRemove);
    // Draw the middle circle with the same stroke as the rectangles
    canvas.drawCircle(centerOffset, centerCircleRadius + padding, circlePaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(PokeBallPainter oldDelegate) =>
      oldDelegate.color != this.color || oldDelegate.opacity != this.opacity;
}
