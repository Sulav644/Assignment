import 'package:xoomship/contacts/all_contacts/all_contacts.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/utils.dart';

class ToggleButton extends StatelessWidget {
  final String title;
  final bool status;
  final VoidCallback onClick;
  const ToggleButton(
      {super.key,
      required this.status,
      required this.onClick,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Column(children: [
      Row(children: [
        SizedBox(
          width: spc.wdRat(0.12),
        ),
        title.bold(),
      ]),
      const SizedBox(
        height: 10,
      ),
      Row(children: [
        SizedBox(
          width: spc.wdRat(0.12),
        ),
        CupertinoSwitch(value: status, onChanged: (val) => onClick()),
      ]),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
