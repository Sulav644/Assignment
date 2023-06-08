import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/profile_page/components/bloc/add_multiple_address_cubit.dart';
import '../../../core/components/add_icon.dart';
import '../../core/utils.dart';
import '../../dash_board/drawer/bloc/location_details_cubit.dart';

class ConnectApps extends StatefulWidget {
  const ConnectApps({super.key});

  @override
  State<ConnectApps> createState() => _ConnectAppsState();
}

class _ConnectAppsState extends State<ConnectApps> {
  FocusNode addressNode = FocusNode();
  FocusNode areaNode = FocusNode();
  FocusNode landmarkNode = FocusNode();
  FocusNode cityNode = FocusNode();
  FocusNode zipcodeNode = FocusNode();
  FocusNode countryNode = FocusNode();
  bool showLoadButton = true;
  bool isConfirmedPickedUp = false;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));
    final spc = Space(context: context);
    final gapBetweenInputFields = spc.hghtRat(0.02);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: spc.wdRat(0.5),
          child: const Text(
            "Add Multiple Address",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
          ),
        ),
        // const AddIcon()
        GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      addressNode.unfocus();
                      areaNode.unfocus();
                      landmarkNode.unfocus();
                      cityNode.unfocus();
                      zipcodeNode.unfocus();
                      countryNode.unfocus();
                    },
                    child: Container(
                        height: spc.hghtRat(0.7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        child: Padding(
                          padding: EdgeInsets.all(spc.wdRat(0.05)),
                          child: ListView(children: [
                            Row(
                              children: [
                                Text(
                                  'Location Pickup',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: spc.hghtRat(0.025),
                            ),
                            TextField(
                              focusNode: addressNode,
                              decoration: InputDecoration(
                                  hintText: 'Address',
                                  labelText: 'Address',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setAddress(address: value);
                              },
                            ),
                            SizedBox(
                              height: gapBetweenInputFields,
                            ),
                            TextField(
                              focusNode: areaNode,
                              decoration: InputDecoration(
                                  hintText: 'Area',
                                  labelText: 'Area',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setArea(area: value);
                              },
                            ),
                            SizedBox(
                              height: gapBetweenInputFields,
                            ),
                            TextField(
                              focusNode: landmarkNode,
                              decoration: InputDecoration(
                                  hintText: 'Landmark',
                                  labelText: 'Landmark',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setLandmark(landmark: value);
                              },
                            ),
                            SizedBox(
                              height: gapBetweenInputFields,
                            ),
                            TextField(
                              focusNode: cityNode,
                              decoration: InputDecoration(
                                  hintText: 'City',
                                  labelText: 'City',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setCity(city: value);
                              },
                            ),
                            SizedBox(
                              height: gapBetweenInputFields,
                            ),
                            TextField(
                              focusNode: zipcodeNode,
                              decoration: InputDecoration(
                                  hintText: 'Zip Code',
                                  labelText: 'Zip Code',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setZipCode(zipCode: value);
                              },
                            ),
                            SizedBox(
                              height: gapBetweenInputFields,
                            ),
                            TextField(
                              focusNode: countryNode,
                              decoration: InputDecoration(
                                  hintText: 'Country',
                                  labelText: 'Country',
                                  border: border,
                                  enabledBorder: border,
                                  focusedBorder: border),
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                context
                                    .read<LocationDetailsCubit>()
                                    .setCountry(country: value);
                              },
                            ),
                            SizedBox(
                              height: spc.hghtRat(0.05),
                            ),
                            Align(
                              child: GestureDetector(
                                onTap: () {
                                  final data = context
                                      .read<LocationDetailsCubit>()
                                      .state;
                                  context
                                      .read<AddMultipleAddressCubit>()
                                      .addAddress(
                                          address: data.address!,
                                          area: data.area!,
                                          stateName: data.state!,
                                          landmark: data.landmark!,
                                          city: data.city!,
                                          zipCode: data.zipCode!,
                                          country: data.country!);
                                },
                                child: Container(
                                  width: spc.wdRat(0.6),
                                  height: spc.hghtRat(0.06),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 3, 93, 158),
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'SUBMIT',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        )),
                  );
                },
              );
            },
            child: Icon(Icons.add)),
      ]),
    );
  }
}
