import 'package:xoomship/contacts/all_contacts/data/data_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/add_contact_view.dart';
import '../../add_contact_form/add_contact.dart';
import '../../add_contact_form/data/form_use_type.dart';
import '../../single_contact/single_contact.dart';
import '../all_contacts.dart';

class ActionButtons extends StatefulWidget {
  final int companyBasicId;
  final int loginId;
  final String userName;
  const ActionButtons(
      {super.key,
      required this.companyBasicId,
      required this.loginId,
      required this.userName});

  @override
  State<ActionButtons> createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  bool showLoading = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      InkWell(
        child: IconButton(
            onPressed: () {
              singleStateManager(context).getPage(
                  companyBasicId: widget.companyBasicId,
                  loginId: widget.loginId);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const AddContactView(
                  formUseType: FormUseType.update(),
                ),
              ));
            },
            icon: const Icon(Icons.edit_outlined)),
      ),
      InkWell(
        child: IconButton(
            onPressed: () async => showDialog(
                  context: context,
                  builder: (context) => StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              'Are you sure want to delete it ?'.bold(),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('NO')),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () {
                                          setState(() {
                                            showLoading = true;
                                          });
                                          context
                                              .read<SinglePagedDataNotifier>()
                                              .deleteData(
                                                  companyBasicId:
                                                      widget.companyBasicId,
                                                  loginId: widget.loginId)
                                              .then((value) {
                                            stateManager(context).getPage(
                                              jsonDataSelector: (json) =>
                                                  json as List<dynamic>,
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Contact Deleted Successfully')));
                                            setState(() {
                                              showLoading = false;
                                            });
                                            Navigator.pop(context);
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllContacts(),
                                            ));
                                          });
                                        },
                                        child: showLoading
                                            ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator())
                                            : const Text('YES'))
                                  ])
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            icon: const Icon(Icons.delete_outline)),
      ),
      InkWell(
        child: IconButton(
            onPressed: () {
              singleStateManager(context).getPage(
                  companyBasicId: widget.companyBasicId,
                  loginId: widget.loginId);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => SingleContact(
                  userName: widget.userName,
                ),
              ));
            },
            icon: const Icon(Icons.keyboard_arrow_right)),
      )
    ]);
  }
}
