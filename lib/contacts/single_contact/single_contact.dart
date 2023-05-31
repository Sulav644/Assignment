import 'package:assignment_app/assignment/contacts/all_contacts/all_contacts.dart';
import 'package:assignment_app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_contact_form/add_contact.dart';
import '../all_contacts/data/data_notifier.dart';
import '../all_contacts/data/data_response_notifier.dart';
import 'components/single_item.dart';

class SingleContact extends StatelessWidget {
  final String userName;
  const SingleContact({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();
    return WillPopScope(
      onWillPop: () async {
        stateManager(context).getDataResponse();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const AllContacts(),
        ));
        return true;
      },
      child: Scaffold(
        appBar: cmp.appBar,
        body: BlocBuilder<SingleDataResponseNotifier, SinglePagedDataState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.map(
                        initial: (_) => 1,
                        loadInProgress: (_) => 1,
                        loadSuccess: (_) => 1,
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
                          loadSuccess: (_) => SingleItem(
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
      ),
    );
  }
}
