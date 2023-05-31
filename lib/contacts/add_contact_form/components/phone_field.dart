import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils.dart';
import '../domain/add_data_cubit.dart';

class PhoneField extends StatelessWidget {
  final FocusNode node;
  final String txt;
  final TextEditingController? controller;
  final OutlineInputBorder border;
  const PhoneField(
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
              children: const [Icon(Icons.phone_outlined)]),
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
                        prefixText: '+91'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        context.read<AddDataCubit>().setMobile(value),
                    maxLength: 10,
                    validator: (value) {
                      if (value!.length < 10) {
                        return 'Phone number cannot be less than 10 characters';
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
