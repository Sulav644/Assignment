import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:xoomship/core/utils.dart';

class PriceLevel extends StatelessWidget {
  final String title;
  final String price;
  Color? boxColor;
  Color? textColor;
  PriceLevel(
      {super.key,
      required this.title,
      required this.price,
      this.boxColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: spc.wdRat(0.55),
            decoration: BoxDecoration(
                color: boxColor ?? const Color.fromARGB(255, 226, 221, 221),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    '${title}',
                    style: TextStyle(
                        color: textColor ?? Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${price}',
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ]),
      ),
    );
  }
}
