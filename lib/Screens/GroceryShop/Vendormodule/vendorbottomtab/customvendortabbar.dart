import 'package:flutter/material.dart';

class CustomVendorTabBar extends Decoration {
  final Color color;
  final double indicatorHeight; // Add this property

  CustomVendorTabBar(this.color, {this.indicatorHeight = 30.0}); // Provide a default height

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomVendorTabBar decoration;

  _CustomPainter(this.decoration);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();

    paint.color = decoration.color;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, decoration.indicatorHeight)), // Adjust height here
        const Radius.circular(16.0),
      ),
      paint,
    );
  }
}
