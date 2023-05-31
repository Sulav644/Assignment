import 'package:flutter/material.dart';

import '../../core/utils.dart';

class StatStick extends StatelessWidget {
  final double height;
  final Color color;
  final int val;
  const StatStick(
      {super.key,
      required this.height,
      required this.val,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Tooltip(
            message: '3.68k',
            padding: const EdgeInsets.all(10),
            showDuration: const Duration(seconds: 2),
            textStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
            preferBelow: false,
            verticalOffset: spc.hghtRat(0.03),
            decoration: const ShapeDecoration(
                shape: TooltipCustomShapeDecoration(), color: Colors.white),
            child: Container(
              width: 7,
              height: spc.wdRat(height),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$val',
            style:
                TextStyle(color: val == 0 ? Colors.transparent : Colors.white),
          ),
        ],
      ),
    );
  }
}

class TooltipCustomShapeDecoration extends ShapeBorder {
  final bool isPaddingRequired;
  const TooltipCustomShapeDecoration({this.isPaddingRequired = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: isPaddingRequired ? 20 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    rect =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 20));
    return Path()
      ..addRRect(
          RRect.fromRectAndRadius(rect, Radius.circular(rect.height / 8)))
      ..moveTo(rect.bottomCenter.dx - 10, rect.bottomCenter.dy)
      ..relativeLineTo(10, 6)
      ..relativeLineTo(10, -6)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
