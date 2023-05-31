import 'dart:math';
import 'package:flutter/material.dart';

import '../../core/utils.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Stack(children: [
      SizedBox(
        height: spc.hghtRat(0.27),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: spc.wdRat(1),
            height: 1,
            color: Colors.white,
          )
        ]),
      ),
      SizedBox(
        height: spc.hghtRat(0.27),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Transform.rotate(
            angle: 25 / 100 * pi,
            child: Container(
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
          Transform.rotate(
            angle: 25 / 100 * pi,
            child: Container(
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          )
        ]),
      )
    ]);
  }
}
