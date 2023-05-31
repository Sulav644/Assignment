import 'package:assignment_app/assignment/contacts/all_contacts/data/data_notifier.dart';
import 'package:assignment_app/assignment/contacts/all_contacts/data/data_response_notifier.dart';
import 'package:assignment_app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/list_item.dart';

extension BoldText on String {
  Widget bold() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        this,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

extension SemiBoldText on String {
  Widget semiBold() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        this,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}

class AllContacts extends StatelessWidget {
  const AllContacts({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();
    return Scaffold(
      appBar: cmp.appBar,
      body: BlocBuilder<DataResponseNotifier, PagedDataState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Text(
                          'Contacts List',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.map(
                      initial: (_) => 1,
                      loadInProgress: (_) => 1,
                      loadSuccess: (_) =>
                          _.data.entity.isEmpty ? 1 : _.data.entity.length,
                      loadFailure: (_) => 0,
                    ),
                    itemBuilder: (context, index) {
                      return state.map(
                        initial: (_) => Container(),
                        loadInProgress: (_) => SizedBox(
                          height: spc.hghtRat(1),
                          child: Column(
                            children: [
                              SizedBox(
                                height: spc.hghtRat(0.4),
                              ),
                              const CircularProgressIndicator(),
                            ],
                          ),
                        ),
                        loadSuccess: (_) => ListItem(
                          index: index,
                          load: _,
                        ),
                        loadFailure: (_) => const Text('no data'),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
