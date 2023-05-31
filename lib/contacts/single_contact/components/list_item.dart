import 'package:assignment_app/assignment/contacts/all_contacts/all_contacts.dart';
import 'package:assignment_app/assignment/contacts/all_contacts/data/data_notifier.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../add_contact_form/add_contact.dart';

class ListItem extends StatelessWidget {
  final int index;
  final PagedDataState load;
  const ListItem({super.key, required this.index, required this.load});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return load.data.entity.isEmpty
        ? SizedBox(
            height: spc.hghtRat(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'No Contacts Added'.bold(),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                'Account Type Name'.bold(),
                load.data.entity[index].accountTypeName!.semiBold(),
                'Contact Type'.bold(),
                load.data.entity[index].contactType!.semiBold(),
                'Company'.bold(),
                load.data.entity[index].company!.semiBold(),
                'Store Name'.bold(),
                load.data.entity[index].storeName != null
                    ? Column(children: [
                        ...load.data.entity[index].storeName!
                            .split(',')
                            .map(
                              (e) => e.semiBold(),
                            )
                            .toList()
                      ])
                    : 'null'.semiBold(),
                'Contact Company'.bold(),
                load.data.entity[index].contactCompany!.semiBold(),
                'Inserted Date'.bold(),
                load.data.entity[index].insertedDate!.semiBold(),
                'Country'.bold(),
                load.data.entity[index].country!.semiBold(),
                'Identity Type'.bold(),
                load.data.entity[index].identityType!.semiBold(),
                'Identity Number'.bold(),
                load.data.entity[index].identityNumber!.semiBold(),
                'Professional Skills'.bold(),
                load.data.entity[index].professionalSkills!.semiBold(),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                'Login Name'.bold(),
                load.data.entity[index].loginName!.semiBold(),
                'Name'.bold(),
                load.data.entity[index].name!.semiBold(),
                'Password'.bold(),
                load.data.entity[index].password!.semiBold(),
                'Email Id'.bold(),
                load.data.entity[index].emailId!.semiBold(),
                'Mobile'.bold(),
                load.data.entity[index].mobile!.semiBold(),
                'Address'.bold(),
                load.data.entity[index].address!.semiBold(),
                'City'.bold(),
                load.data.entity[index].city!.semiBold(),
                'State'.bold(),
                load.data.entity[index].state!.semiBold(),
                'Zip Code'.bold(),
                load.data.entity[index].zipCode!.semiBold(),
                const SizedBox(
                  height: 14,
                ),
                Row(children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: () {
                        stateManager(context).getDataResponse();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const AllContacts(),
                        ));
                      },
                      icon: const Icon(Icons.delete_outline)),
                  IconButton(
                      onPressed: () {
                        singleStateManager(context).getDataResponse(
                            companyBasicId:
                                load.data.entity[index].companyBasicId!,
                            loginId: load.data.entity[index].loginId!);
                      },
                      icon: const Icon(Icons.keyboard_arrow_right))
                ])
              ])
            ],
          );
  }
}
