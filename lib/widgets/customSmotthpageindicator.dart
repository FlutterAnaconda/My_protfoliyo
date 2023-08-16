import 'dart:math';
import 'dart:ui' as ui show lerpDouble;

import 'package:flutter/material.dart';

/// Signature for a function that returns color
/// for each [index]
typedef ColorBuilder = Color Function(int index);

/// Holds painting configuration to be used by [CustomizablePainter]
class CustomizableEffect extends IndicatorEffect {
  /// Holds painting decoration for inactive dots
  final DotDecoration dotDecoration;

  /// Holds painting decoration for active dots
  final DotDecoration activeDotDecoration;

  /// Builds dynamic colors for active dot
  final ColorBuilder? activeColorOverride;

  /// Builds dynamic colors for inactive dots
  final ColorBuilder? inActiveColorOverride;

  /// The space between two dots
  final double spacing;

  /// Default constructor
  const CustomizableEffect({
    required this.dotDecoration,
    required this.activeDotDecoration,
    this.activeColorOverride,
    this.spacing = 8,
    this.inActiveColorOverride,
  });

  @override
  Size calculateSize(int count) {
    final activeDotWidth =
        activeDotDecoration.width + activeDotDecoration.dotBorder.neededSpace;
    final dotWidth = dotDecoration.width + dotDecoration.dotBorder.neededSpace;

    final maxWidth =
        dotWidth * (count - 1) + (spacing * count) + activeDotWidth;

    final offsetSpace =
        (dotDecoration.verticalOffset - activeDotDecoration.verticalOffset)
            .abs();
    final maxHeight = max(
      dotDecoration.height + offsetSpace + dotDecoration.dotBorder.neededSpace,
      activeDotDecoration.height +
          offsetSpace +
          activeDotDecoration.dotBorder.neededSpace,
    );
    return Size(maxWidth, maxHeight);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    var anchor = -spacing / 2;
    for (var index = 0; index < count; index++) {
      var dotWidth = dotDecoration.width + dotDecoration.dotBorder.neededSpace;
      if (index == current) {
        dotWidth = activeDotDecoration.width +
            activeDotDecoration.dotBorder.neededSpace;
      }

      var widthBound = dotWidth + spacing;
      if (dx <= (anchor += widthBound)) {
        return index;
      }
    }
    return -1;
  }

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return CustomizablePainter(count: count, offset: offset, effect: this);
  }
}

/// Holds dot painting specs
class DotDecoration {
  /// The border radius of the dot
  final BorderRadius borderRadius;

  /// The color of the dot
  final Color color;

  /// The dotBorder configuration of the dot
  final DotBorder dotBorder;

  /// The vertical offset of the dot
  final double verticalOffset;

  /// The rotation angle of the dot
  final double rotationAngle;

  /// The width of the dot
  final double width;

  /// the height of the dot
  final double height;

  /// Default constructor
  const DotDecoration(
      {this.borderRadius = BorderRadius.zero,
      this.color = Colors.white,
      this.dotBorder = DotBorder.none,
      this.verticalOffset = 0.0,
      this.rotationAngle = 0.0,
      this.width = 8,
      this.height = 8});

  /// Lerps the value between active dot and prev-active dot
  static DotDecoration lerp(DotDecoration a, DotDecoration b, double t) {
    return DotDecoration(
        borderRadius: BorderRadius.lerp(a.borderRadius, b.borderRadius, t)!,
        width: ui.lerpDouble(a.width, b.width, t) ?? 0.0,
        height: ui.lerpDouble(a.height, b.height, t) ?? 0.0,
        color: Color.lerp(a.color, b.color, t)!,
        dotBorder: DotBorder.lerp(a.dotBorder, b.dotBorder, t),
        verticalOffset:
            ui.lerpDouble(a.verticalOffset, b.verticalOffset, t) ?? 0.0,
        rotationAngle:
            ui.lerpDouble(a.rotationAngle, b.rotationAngle, t) ?? 0.0);
  }

  /// Builds a new instance with the given
  /// override values
  DotDecoration copyWith({
    BorderRadius? borderRadius,
    double? width,
    double? height,
    Color? color,
    DotBorder? dotBorder,
    double? verticalOffset,
    double? rotationAngle,
  }) {
    return DotDecoration(
      borderRadius: borderRadius ?? this.borderRadius,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      dotBorder: dotBorder ?? this.dotBorder,
      verticalOffset: verticalOffset ?? this.verticalOffset,
      rotationAngle: rotationAngle ?? this.rotationAngle,
    );
  }
}

/// The variants of dot borders
enum DotBorderType {
  /// Draw a sold border
  solid,

  /// Draw nothing
  none
}

/// Holds dot-border painting specs
class DotBorder {
  /// The thinness of the border line
  final double width;

  /// The color of the border
  final Color color;

  /// The padding between the dot and the border
  final double padding;

  /// The border variant
  final DotBorderType type;

  /// Default constructor
  const DotBorder({
    this.width = 1.0,
    this.color = Colors.black87,
    this.padding = 0.0,
    this.type = DotBorderType.solid,
  });

  /// Calculates the needed gap based on [type]
  double get neededSpace =>
      type == DotBorderType.none ? 0.0 : (width / 2 + (padding * 2));

  /// Builds an instance with type [DotBorderType.none]
  static const none = DotBorder._none();

  const DotBorder._none()
      : width = 0.0,
        color = Colors.transparent,
        padding = 0.0,
        type = DotBorderType.none;

  /// Lerps the value between active dot border and prev-active dot's border
  static DotBorder lerp(DotBorder a, DotBorder b, double t) {
    if (t == 0.0) {
      return a;
    }
    if (t == 1.0) {
      return b;
    }
    return DotBorder(
        color: Color.lerp(a.color, b.color, t)!,
        width: ui.lerpDouble(a.width, b.width, t)!,
        padding: ui.lerpDouble(a.padding, b.padding, t)!);
  }
}

/// Paints user-customizable transition effect between active
/// and non-active dots
///
/// Live demos at
/// https://github.com/Milad-Akarie/smooth_page_indicator/blob/f7ee92e7413a31de77bfb487755d64a385d52a52/demo/custimizable-1.gif
/// https://github.com/Milad-Akarie/smooth_page_indicator/blob/f7ee92e7413a31de77bfb487755d64a385d52a52/demo/customizable-2.gif
/// https://github.com/Milad-Akarie/smooth_page_indicator/blob/f7ee92e7413a31de77bfb487755d64a385d52a52/demo/customizable-3.gif
/// https://github.com/Milad-Akarie/smooth_page_indicator/blob/f7ee92e7413a31de77bfb487755d64a385d52a52/demo/customizable-4.gif
class CustomizablePainter extends IndicatorPainter {
  /// The painting configuration
  final CustomizableEffect effect;

  /// The number of pages
  final int count;

  /// Default constructor
  CustomizablePainter({
    required double offset,
    required this.effect,
    required this.count,
  }) : super(offset);

  @override
  void paint(Canvas canvas, Size size) {
    var activeDotDecoration = effect.activeDotDecoration;
    var dotDecoration = effect.dotDecoration;
    final current = offset.floor();

    final dotOffset = offset - current;
    final maxVerticalOffset = max(
      activeDotDecoration.verticalOffset,
      dotDecoration.verticalOffset,
    );

    var yTranslation = 0.0;
    if (activeDotDecoration.verticalOffset >= dotDecoration.verticalOffset) {
      yTranslation =
          activeDotDecoration.verticalOffset - dotDecoration.verticalOffset;
    } else {
      yTranslation =
          dotDecoration.verticalOffset - activeDotDecoration.verticalOffset;
    }
    canvas.translate(0, -maxVerticalOffset + yTranslation / 2);

    var drawingOffset = effect.spacing / 2;

    for (var i = 0; i < count; i++) {
      if (effect.inActiveColorOverride != null) {
        dotDecoration = dotDecoration.copyWith(
            color: effect.inActiveColorOverride!.call(i));
      }
      if (effect.activeColorOverride != null) {
        activeDotDecoration = activeDotDecoration.copyWith(
            color: effect.activeColorOverride!.call(i));
      }
      var decoration = dotDecoration;
      if (i == current) {
        decoration =
            DotDecoration.lerp(activeDotDecoration, dotDecoration, dotOffset);
      } else if (i - 1 == current || (i == 0 && offset > count - 1)) {
        decoration =
            DotDecoration.lerp(dotDecoration, activeDotDecoration, dotOffset);
      }

      final xPos = drawingOffset + decoration.dotBorder.neededSpace / 2;
      final yPos = (size.height / 2) + decoration.verticalOffset;

      final rRect = RRect.fromLTRBAndCorners(
        xPos,
        yPos - decoration.height / 2,
        xPos + decoration.width,
        yPos + decoration.height / 2,
        topLeft: decoration.borderRadius.topLeft,
        topRight: decoration.borderRadius.topRight,
        bottomLeft: decoration.borderRadius.bottomLeft,
        bottomRight: decoration.borderRadius.bottomRight,
      );

      var scaledRect = rRect.outerRect.inflate(decoration.dotBorder.padding);
      final scaleRatioX = scaledRect.width / rRect.width;
      final scaleRatioY = scaledRect.height / rRect.height;

      final scaledRRect = RRect.fromRectAndCorners(
        scaledRect,
        topLeft: Radius.elliptical(
            rRect.tlRadiusX * scaleRatioX, rRect.tlRadiusY * scaleRatioY),
        topRight: Radius.elliptical(
            rRect.trRadiusX * scaleRatioX, rRect.trRadiusY * scaleRatioY),
        bottomRight: Radius.elliptical(
            rRect.brRadiusX * scaleRatioX, rRect.brRadiusY * scaleRatioY),
        bottomLeft: Radius.elliptical(
            rRect.blRadiusX * scaleRatioX, rRect.blRadiusY * scaleRatioY),
      );

      drawingOffset = scaledRRect.right + effect.spacing;

      var path = Path()..addRRect(rRect);

      final matrix4 = Matrix4.identity();
      if (decoration.rotationAngle != 0) {
        matrix4.rotateAngle(
          decoration.rotationAngle,
          origin: Offset(rRect.right - (rRect.width / 2), yPos),
        );
      }

      canvas.drawPath(
        path.transform(matrix4.storage),
        Paint()..color = decoration.color,
      );

      final borderPaint = Paint()
        ..strokeWidth = decoration.dotBorder.width
        ..style = PaintingStyle.stroke
        ..color = decoration.dotBorder.color;

      final borderPath = Path()..addRRect(scaledRRect);

      canvas.drawPath(
        borderPath.transform(matrix4.storage),
        borderPaint,
      );
    }
  }
}

/// Adds [rotateAngle] functionality to [Matrix4]
extension Matrix4X on Matrix4 {
  /// Rotates teh matrix by given [angle]
  Matrix4 rotateAngle(double angle, {Offset? origin}) {
    final angleRadians = angle * pi / 180;

    if (angleRadians == 0.0) {
      return this;
    } else if ((origin == null) || (origin.dx == 0.0 && origin.dy == 0.0)) {
      return this..rotateZ(angleRadians);
    } else {
      return this
        ..translate(origin.dx, origin.dy)
        ..multiply(Matrix4.rotationZ(angleRadians))
        ..translate(-origin.dx, -origin.dy);
    }
  }
}

abstract class IndicatorEffect {
  const IndicatorEffect();

  /// Builds a new painter every time the page offset changes
  IndicatorPainter buildPainter(int count, double offset);

  /// Calculates the size of canvas based on
  /// dots count, size and spacing
  ///
  /// Other effects can override this function
  /// to calculate their own size
  Size calculateSize(int count);

  /// Returns the index of the section that contains [dx].
  ///
  /// Sections or hit-targets are calculated differently
  /// in some effects
  int hitTestDots(double dx, int count, double current);
}

abstract class BasicIndicatorEffect extends IndicatorEffect {
  /// Singe dot width
  final double dotWidth;

  /// Singe dot height
  final double dotHeight;

  /// The horizontal space between dots
  final double spacing;

  /// Single dot radius
  final double radius;

  /// Inactive dots color or all dots in some effects
  final Color dotColor;

  /// The active dot color
  final Color activeDotColor;

  /// Inactive dots paint style (fill|stroke) defaults to fill.
  final PaintingStyle paintStyle;

  /// This is ignored if [paintStyle] is PaintStyle.fill
  final double strokeWidth;

  const BasicIndicatorEffect({
    required this.strokeWidth,
    required this.dotWidth,
    required this.dotHeight,
    required this.spacing,
    required this.radius,
    required this.dotColor,
    required this.paintStyle,
    required this.activeDotColor,
  }) : assert(dotWidth >= 0 &&
            dotHeight >= 0 &&
            spacing >= 0 &&
            strokeWidth >= 0);

  @override
  Size calculateSize(int count) {
    return Size(dotWidth * count + (spacing * (count - 1)), dotHeight);
  }

  @override
  int hitTestDots(double dx, int count, double current) {
    var offset = -spacing / 2;
    for (var index = 0; index < count; index++) {
      if (dx <= (offset += dotWidth + spacing)) {
        return index;
      }
    }
    return -1;
  }
}

abstract class BasicIndicatorPainter extends IndicatorPainter {
  /// The count of pages
  final int count;

  // The provided effect is passed to this super class
  // to make some calculations and paint still dots
  final BasicIndicatorEffect _effect;

  /// Inactive dot paint or base paint in one-color effects.
  final Paint dotPaint;

  /// The Radius of all dots
  final Radius dotRadius;

  BasicIndicatorPainter(
    double offset,
    this.count,
    this._effect,
  )   : dotRadius = Radius.circular(_effect.radius),
        dotPaint = Paint()
          ..color = _effect.dotColor
          ..style = _effect.paintStyle
          ..strokeWidth = _effect.strokeWidth,
        super(offset);

  // The distance between dot lefts
  double get distance => _effect.dotWidth + _effect.spacing;

  void paintStillDots(Canvas canvas, Size size) {
    for (var i = 0; i < count; i++) {
      final xPos = (i * distance);
      final yPos = size.height / 2;
      final bounds = Rect.fromLTRB(
        xPos,
        yPos - _effect.dotHeight / 2,
        xPos + _effect.dotWidth,
        yPos + _effect.dotHeight / 2,
      );
      var rect = RRect.fromRectAndRadius(bounds, dotRadius);
      canvas.drawRRect(rect, dotPaint);
    }
  }

  RRect calcPortalTravel(Size size, double offset, double dotOffset) {
    final yPos = size.height / 2;
    var width = dotOffset * (_effect.dotHeight / 2);
    var height = dotOffset * (_effect.dotWidth / 2);
    var xPos = offset;
    return RRect.fromLTRBR(
      xPos - height,
      yPos - width,
      xPos + height,
      yPos + width,
      Radius.circular(dotRadius.x * dotOffset),
    );
  }
}

abstract class IndicatorPainter extends CustomPainter {
  /// The raw offset from the [PageController].page
  final double offset;

  const IndicatorPainter(this.offset);

  @override
  bool shouldRepaint(IndicatorPainter oldDelegate) {
    // only repaint if the offset changes
    return oldDelegate.offset != offset;
  }
}
