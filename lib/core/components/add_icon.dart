import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 65, 63, 63)),
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: const Text(
          '+',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
