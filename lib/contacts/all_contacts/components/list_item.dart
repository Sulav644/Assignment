import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../all_contacts.dart';
import '../data/data_notifier.dart';
import 'action_buttons.dart';

class ListItem extends StatelessWidget {
  final int index;
  final PagedDataState load;
  const ListItem({super.key, required this.index, required this.load});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final data = load.data;

    return data.isEmpty
        ? SizedBox(
            height: spc.hghtRat(1),
            child: Column(
              children: [
                SizedBox(
                  height: spc.hghtRat(0.4),
                ),
                'No Contacts Added'.bold(),
              ],
            ),
          )
        : Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        'Login Name'.bold(),
                        (data[index].loginName ?? 'null').semiBold(),
                        'Name'.bold(),
                        (data[index].name ?? 'null').semiBold(),
                        'Password'.bold(),
                        (data[index].password ?? 'null').semiBold(),
                        'Email Id'.bold(),
                        (data[index].emailId ?? 'null').semiBold(),
                        'Mobile'.bold(),
                        (data[index].mobile ?? 'null').semiBold(),
                      ]),
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    'Address'.bold(),
                    data[index].address != null
                        ? Column(children: [
                            ...data[index]
                                .address!
                                .split(',')
                                .map((e) => e.semiBold())
                                .toList()
                          ])
                        : 'null'.semiBold(),
                    'City'.bold(),
                    (data[index].city ?? 'null').semiBold(),
                    'State'.bold(),
                    (data[index].state ?? 'null').semiBold(),
                    'Zip Code'.bold(),
                    (data[index].zipCode ?? 'null').semiBold(),
                    const SizedBox(
                      height: 14,
                    ),
                    ActionButtons(
                      companyBasicId: data[index].companyBasicId!,
                      loginId: data[index].loginId!,
                      userName: data[index].name!,
                    ),
                  ])
                ],
              ),
            ),
          );
  }
}
