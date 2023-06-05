import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../domain/add_data_cubit.dart';

const dynamic pregex =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,20}$';

class PasswordInputField extends StatelessWidget {
  final FocusNode node;
  final String txt;
  final TextEditingController? controller;
  final OutlineInputBorder border;
  const PasswordInputField(
      {super.key,
      required this.txt,
      required this.border,
      this.controller,
      required this.node});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [Icon(Icons.no_encryption_outlined)]),
          SizedBox(
            width: spc.wdRat(0.06),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFormField(
                    focusNode: node,
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: txt,
                      hintText: txt,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) =>
                        context.read<AddDataCubit>().setPassword(value),
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Password cannot be empty';
                      }
                      if (value.length < 6 || value.length > 20) {
                        return 'Password must be 6 to 20 characters';
                      }
                      if (!RegExp(pregex.toString())
                          .hasMatch(value.toString())) {
                        return 'Should contain at least one\nUppercase\none Lowercase\none number\nand one Special character';
                      }
                      return null;
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
