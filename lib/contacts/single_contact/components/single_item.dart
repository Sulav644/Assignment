import 'package:xoomship/contacts/all_contacts/all_contacts.dart';
import 'package:flutter/material.dart';

import '../../all_contacts/data/data_notifier.dart';

class SingleItem extends StatelessWidget {
  final SinglePagedDataState load;
  const SingleItem({super.key, required this.load});

  @override
  Widget build(BuildContext context) {
    final data = load.data;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          'Account Type Name'.bold(),
          (data.accountTypeName ?? 'null').semiBold(),
          'Contact Type'.bold(),
          (data.contactType ?? 'null').semiBold(),
          'Company'.bold(),
          (data.company ?? 'null').semiBold(),
          'Store Name'.bold(),
          data.storeName != null
              ? Column(children: [
                  ...data.storeName!
                      .split(',')
                      .map(
                        (e) => e.semiBold(),
                      )
                      .toList()
                ])
              : 'null'.semiBold(),
          'Contact Company'.bold(),
          (data.contactCompany ?? 'null').semiBold(),
          'Inserted Date'.bold(),
          (data.insertedDate ?? 'null').semiBold(),
          'Country'.bold(),
          (data.country ?? 'null').semiBold(),
          'Identity Type'.bold(),
          (data.identityType ?? 'null').semiBold(),
          'Identity Number'.bold(),
          (data.identityNumber ?? 'null').semiBold(),
          'Professional Skills'.bold(),
          (data.professionalSkills ?? 'null').semiBold(),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          'Login Name'.bold(),
          (data.loginName ?? 'null').semiBold(),
          'Name'.bold(),
          (data.name ?? 'null').semiBold(),
          'Password'.bold(),
          (data.password ?? 'null').semiBold(),
          'Email Id'.bold(),
          (data.emailId ?? 'null').semiBold(),
          'Mobile'.bold(),
          (data.mobile ?? 'null').semiBold(),
          'Address'.bold(),
          data.address != null
              ? Column(children: [
                  ...data.address!.split(',').map((e) => e.semiBold()).toList(),
                ])
              : 'null'.semiBold(),
          'City'.bold(),
          (data.city ?? 'null').semiBold(),
          'State'.bold(),
          (data.state ?? 'null').semiBold(),
          'Zip Code'.bold(),
          (data.zipCode ?? 'null').semiBold(),
          const SizedBox(
            height: 14,
          ),
        ])
      ],
    );
  }
}
