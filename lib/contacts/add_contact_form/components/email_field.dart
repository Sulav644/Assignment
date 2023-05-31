import 'package:assignment_app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/add_data_cubit.dart';

const dynamic emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool isEmail(String phoneOrMail) {
  if (RegExp(emailPattern.toString()).hasMatch(phoneOrMail)) {
    return true;
  } else {
    return false;
  }
}

class EmailField extends StatelessWidget {
  final FocusNode node;
  final String txt;
  final TextEditingController? controller;
  final OutlineInputBorder border;
  const EmailField(
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
              children: const [Icon(Icons.email_outlined)]),
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
                        context.read<AddDataCubit>().setEmailId(value),
                    validator: (value) {
                      if (!isEmail(value!)) {
                        return 'invalid email';
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
