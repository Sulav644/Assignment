import 'package:xoomship/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class AccountLogoWithDetailsForUnExpandedDrawer extends StatelessWidget {
  const AccountLogoWithDetailsForUnExpandedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: spc.wdRat(0.01)),
      child: Container(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.more_horiz),
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(child: Image.asset('assets/images/boy_1.png')),
              const SizedBox(
                height: 10,
              ),
            ],
          )),
    ));
  }
}
