import 'package:flutter/material.dart';
import '../../../core/components/add_icon.dart';
import '../../core/utils.dart';

class ConnectApps extends StatelessWidget {
  const ConnectApps({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: spc.wdRat(0.5),
          child: const Text(
            "Apps you've connected",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
          ),
        ),
        const AddIcon()
      ]),
    );
  }
}
