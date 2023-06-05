import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 38,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: const Color.fromARGB(255, 124, 120, 120))),
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 15,
            height: 20,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(100)),
          ),
        ));
  }
}
