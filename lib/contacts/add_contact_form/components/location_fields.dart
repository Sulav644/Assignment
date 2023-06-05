import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils.dart';
import '../domain/add_data_cubit.dart';
import '../domain/select_country_cubit.dart';

class LocationFields extends StatelessWidget {
  final FocusNode contactCompanyNode;
  final FocusNode stateNode;
  final FocusNode zipCodeNode;
  final FocusNode cityNode;
  final String? country;
  final TextEditingController? contactCompanyController;
  final TextEditingController? stateController;
  final TextEditingController? zipCodeController;
  final TextEditingController? cityController;

  final OutlineInputBorder border;
  const LocationFields({
    super.key,
    required this.border,
    this.country,
    this.contactCompanyController,
    this.stateController,
    this.zipCodeController,
    this.cityController,
    required this.contactCompanyNode,
    required this.stateNode,
    required this.zipCodeNode,
    required this.cityNode,
  });

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final selectedCountry = context.watch<SelectCountryCubit>().state;
    return IntrinsicHeight(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Icon(Icons.location_on_outlined)]),
              SizedBox(
                width: spc.wdRat(0.06),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => showCountryPicker(
                          context: context,
                          onSelect: (value) {
                            context.read<SelectCountryCubit>().selectCountry(
                                value.displayName.substring(
                                    0, value.displayName.indexOf("(")));
                            context.read<AddDataCubit>().setCountry(value
                                .displayName
                                .substring(0, value.displayName.indexOf("(")));
                          },
                        ),
                        child: Container(
                            width: spc.wdRat(0.4),
                            height: spc.wdRat(0.165),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(6)),
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                country ?? selectedCountry,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 116, 109, 109)),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        focusNode: contactCompanyNode,
                        controller: contactCompanyController,
                        decoration: InputDecoration(
                          labelText: 'Contact Company',
                          hintText: 'Contact Company',
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                        ),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) => context
                            .read<AddDataCubit>()
                            .setContactCompany(value),
                        validator: (value) {
                          if (value == '') {
                            return 'Address cannot be empty';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: spc.wdRat(0.125),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        focusNode: stateNode,
                        controller: stateController,
                        decoration: InputDecoration(
                          labelText: 'State',
                          hintText: 'State',
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                        ),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) =>
                            context.read<AddDataCubit>().setState(value),
                        validator: (value) {
                          if (value == '') {
                            return 'State cannot be empty';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        focusNode: zipCodeNode,
                        controller: zipCodeController,
                        decoration: InputDecoration(
                          labelText: 'Zip Code',
                          hintText: 'Zip Code',
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            context.read<AddDataCubit>().setZipCode(value),
                        validator: (value) {
                          if (value == '') {
                            return 'ZipCode cannot be empty';
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: spc.wdRat(0.125),
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        focusNode: cityNode,
                        controller: cityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                          hintText: 'City',
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
                        ),
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.sentences,
                        onChanged: (value) =>
                            context.read<AddDataCubit>().setCity(value),
                        validator: (value) {
                          if (value == '') {
                            return 'City cannot be empty';
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
        ],
      ),
    );
  }
}
