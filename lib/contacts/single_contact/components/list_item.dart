import 'package:xoomship/contacts/all_contacts/all_contacts.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../add_contact_form/add_contact.dart';
import '../../all_contacts/data/data_notifier.dart';

class ListItem extends StatelessWidget {
  final int index;
  final PagedDataState load;
  const ListItem({super.key, required this.index, required this.load});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return load.data.isEmpty
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
                load.data[index].accountTypeName!.semiBold(),
                'Contact Type'.bold(),
                load.data[index].contactType!.semiBold(),
                'Company'.bold(),
                load.data[index].company!.semiBold(),
                'Store Name'.bold(),
                load.data[index].storeName != null
                    ? Column(children: [
                        ...load.data[index].storeName!
                            .split(',')
                            .map(
                              (e) => e.semiBold(),
                            )
                            .toList()
                      ])
                    : 'null'.semiBold(),
                'Contact Company'.bold(),
                load.data[index].contactCompany!.semiBold(),
                'Inserted Date'.bold(),
                load.data[index].insertedDate!.semiBold(),
                'Country'.bold(),
                load.data[index].country!.semiBold(),
                'Identity Type'.bold(),
                load.data[index].identityType!.semiBold(),
                'Identity Number'.bold(),
                load.data[index].identityNumber!.semiBold(),
                'Professional Skills'.bold(),
                load.data[index].professionalSkills!.semiBold(),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                'Login Name'.bold(),
                load.data[index].loginName!.semiBold(),
                'Name'.bold(),
                load.data[index].name!.semiBold(),
                'Password'.bold(),
                load.data[index].password!.semiBold(),
                'Email Id'.bold(),
                load.data[index].emailId!.semiBold(),
                'Mobile'.bold(),
                load.data[index].mobile!.semiBold(),
                'Address'.bold(),
                load.data[index].address!.semiBold(),
                'City'.bold(),
                load.data[index].city!.semiBold(),
                'State'.bold(),
                load.data[index].state!.semiBold(),
                'Zip Code'.bold(),
                load.data[index].zipCode!.semiBold(),
                const SizedBox(
                  height: 14,
                ),
                Row(children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: () {
                        stateManager(context).getPage(
                          jsonDataSelector: (json) => json as List<dynamic>,
                        );
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const AllContacts(),
                        ));
                      },
                      icon: const Icon(Icons.delete_outline)),
                  IconButton(
                      onPressed: () {
                        singleStateManager(context).getPage(
                            companyBasicId: load.data[index].companyBasicId!,
                            loginId: load.data[index].loginId!);
                      },
                      icon: const Icon(Icons.keyboard_arrow_right))
                ])
              ])
            ],
          );
  }
}
