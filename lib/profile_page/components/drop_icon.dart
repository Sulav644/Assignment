import 'package:flutter/material.dart';

class DropIcon extends StatelessWidget {
  const DropIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Padding(
        padding: const EdgeInsets.only(top: 12, right: 14.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 87, 83, 83),
                      offset: Offset(0, 1),
                      blurRadius: 2)
                ]),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 22,
              ),
            )),
      )
    ]);
  }
}
