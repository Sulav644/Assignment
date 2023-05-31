import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;

  final int indIndex;
  final int labelIndex;
  const TabBarItem(
      {super.key,
      required this.title,
      required this.indIndex,
      required this.labelIndex});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      decoration: BoxDecoration(
          color: indIndex == labelIndex ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
              color: indIndex == labelIndex
                  ? Colors.white
                  : const Color.fromARGB(255, 99, 96, 96),
              fontSize: 14),
        ),
      ),
    );
  }
}
