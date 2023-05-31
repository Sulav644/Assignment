import 'package:assignment_app/assignment/contacts/all_contacts/all_contacts.dart';
import 'package:assignment_app/core/utils.dart';
import 'package:flutter/material.dart';

class ContactType extends StatelessWidget {
  final int contactType;
  final void Function(int?) customerValue;
  final void Function(int?) shopkeeperValue;

  const ContactType(
      {super.key,
      required this.contactType,
      required this.customerValue,
      required this.shopkeeperValue});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: spc.wdRat(0.12),
            ),
            'Contact Type'.bold(),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: spc.wdRat(0.12),
            ),
            Radio(
                value: 0,
                groupValue: contactType,
                onChanged: (val) => customerValue(val)),
            const Text('Customer'),
            SizedBox(
              width: spc.wdRat(0.05),
            ),
            Radio(
                value: 1,
                groupValue: contactType,
                onChanged: (val) => shopkeeperValue(val)),
            const Text('Shopkeeper')
          ],
        ),
      ],
    );
  }
}
