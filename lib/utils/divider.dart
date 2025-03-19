import 'package:blood/utils/empty_util.dart';
import 'package:blood/utils/resources/dimens.dart';
import 'package:flutter/material.dart';

class BloodDivider extends StatelessWidget {
  /// Shows text in the center of the divider.
  final String? text;

  /// Sets [TextStyle] for the [text].
  final TextStyle? style;

  /// Width of each divider.
  ///
  /// If null, divider will be expanded.
  final double? width;

  /// Height of solid divider.
  ///
  /// If null, default height of 1 will be used.
  final double? height;

  /// Starting indentation
  final double? indent;

  /// Ending indentation
  ///
  /// If not provided, [indent] will be used.
  final double? endIndent;

  /// Enables dashed divider.
  final bool dashed;

  final Color? color;

  const BloodDivider({
    super.key,
    this.text,
    this.style,
    this.width,
    this.indent,
    this.endIndent,
    this.dashed = false,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final _color = color ?? const Color(0xFFEBEBEB);

    if (dashed) {
      return CustomPaint(
        painter: _DashLinePainter(color: _color),
        size: Size(width ?? double.maxFinite, 0),
      );
    }

    final divider = SizedBox(
      width: width ?? double.infinity,
      child: Divider(
        thickness: height ?? d_normalBorderWidth,
        height: height ?? d_normalBorderWidth,
        color: _color,
        indent: indent,
        endIndent: endIndent ?? indent,
      ),
    );

    if (text.isNullOrEmpty) return divider;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (width.isNull) Expanded(child: divider) else divider,
        Padding(
          padding: const EdgeInsets.all(d_margin1),
          child: Text(text!, style: style),
        ),
        if (width.isNull) Expanded(child: divider) else divider,
      ],
    );
  }
}

class _DashLinePainter extends CustomPainter {
  final Color color;
  final double width;

  final Paint _paint;

  _DashLinePainter({this.color = Colors.black, this.width = 1})
      : _paint = Paint()
          ..color = color
          ..strokeWidth = width
          ..style = PaintingStyle.stroke
          ..strokeJoin = StrokeJoin.round;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height / 2)
      ..lineTo(size.width, size.height / 2);

    final dashPath = Path();

    const dashWidth = 3.0;
    const dashSpace = 3.0;
    double distance = 0.0;

    for (final pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }
    canvas.drawPath(dashPath, _paint);
  }

  @override
  bool shouldRepaint(_DashLinePainter oldDelegate) => false;
}
