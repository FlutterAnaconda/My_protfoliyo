import 'package:flutter/Material.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(this);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(
    this.decoration,
  );

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint();

    paint.shader = const LinearGradient(
      colors: [
        Color(0xFF07CD6E),
        Color(0xFF059F55),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(rect);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          rect, const Radius.circular(16.0)), // Adjust border radius as needed
      paint,
    );
  }
}
