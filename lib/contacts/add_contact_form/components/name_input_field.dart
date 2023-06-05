import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../domain/add_data_cubit.dart';

class NameInputField extends StatelessWidget {
  final FocusNode loginNode;
  final FocusNode nameNode;
  final OutlineInputBorder border;
  final String loginTxt;
  final TextEditingController? loginController;
  final String nameTxt;
  final TextEditingController? nameController;
  const NameInputField(
      {super.key,
      required this.border,
      required this.loginTxt,
      required this.nameTxt,
      this.loginController,
      this.nameController,
      required this.loginNode,
      required this.nameNode});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Icon(Icons.person_outline)]),
          SizedBox(
            width: spc.wdRat(0.06),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    focusNode: loginNode,
                    controller: loginController,
                    decoration: InputDecoration(
                      labelText: loginTxt,
                      hintText: loginTxt,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) =>
                        context.read<AddDataCubit>().setLoginName(value),
                    validator: (value) {
                      if (value == '') {
                        return 'cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    focusNode: nameNode,
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: nameTxt,
                      hintText: nameTxt,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onChanged: (value) =>
                        context.read<AddDataCubit>().setName(value),
                    validator: (value) {
                      if (value == '') {
                        return 'cannot be empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
