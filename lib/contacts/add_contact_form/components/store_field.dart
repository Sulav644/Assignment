import 'package:assignment_app/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../add_contact.dart';
import '../domain/store_temp_list_cubit.dart';

class StoreField extends StatefulWidget {
  final FocusNode node;
  final String? controller;
  final OutlineInputBorder border;
  final VoidCallback onClick;
  final void Function(String)? onChange;
  final int index;
  final String txt;
  final IconData icon;
  const StoreField(
      {super.key,
      required this.border,
      required this.onClick,
      required this.index,
      required this.txt,
      required this.icon,
      required this.onChange,
      this.controller,
      required this.node});

  @override
  State<StoreField> createState() => _StoreFieldState();
}

class _StoreFieldState extends State<StoreField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Row(
      children: [
        SizedBox(
          width: spc.wdRat(0.12),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: TextFormField(
                  focusNode: widget.node,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      labelText: widget.txt,
                      hintText: widget.txt,
                      border: widget.border,
                      enabledBorder: widget.border,
                      focusedBorder: widget.border,
                      suffixIcon: GestureDetector(
                          onTap: () {
                            if (widget.index == 0) {
                              editStore(context).addStore();
                              context
                                  .read<StoreTempListCubit>()
                                  .addData(text: '');
                            }
                            widget.onClick();
                          },
                          child: Icon(
                            widget.icon,
                            color:
                                widget.index == 0 ? Colors.black : Colors.white,
                          ))),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    context
                        .read<StoreTempListCubit>()
                        .editData(index: widget.index, text: value);
                  },
                  validator: (value) {
                    if (value == '') {
                      return 'StoreName cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
