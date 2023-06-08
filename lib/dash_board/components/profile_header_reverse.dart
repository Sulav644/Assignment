import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/dash_board/components/floating_icon_status_cubit.dart';
import '../../../core/utils.dart';
import '../../core/components/add_icon.dart';
import '../../profile_page/profile_page.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../drawer/bloc/location_details_cubit.dart';

class ProfileHeaderReverse extends StatefulWidget {
  const ProfileHeaderReverse({super.key});

  @override
  State<ProfileHeaderReverse> createState() => _ProfileHeaderReverseState();
}

class _ProfileHeaderReverseState extends State<ProfileHeaderReverse> {
  FocusNode addressNode = FocusNode();
  FocusNode areaNode = FocusNode();
  FocusNode stateNode = FocusNode();
  FocusNode landmarkNode = FocusNode();
  FocusNode cityNode = FocusNode();
  FocusNode zipcodeNode = FocusNode();
  FocusNode countryNode = FocusNode();
  late TextEditingController addressController;
  late TextEditingController areaController;
  late TextEditingController stateController;
  late TextEditingController landmarkController;
  late TextEditingController cityController;
  late TextEditingController zipCodeController;
  late TextEditingController countryController;
  bool showLoadButton = true;
  bool isConfirmedPickedUp = true;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
    areaController = TextEditingController();
    stateController = TextEditingController();
    landmarkController = TextEditingController();
    cityController = TextEditingController();
    zipCodeController = TextEditingController();
    countryController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));
    final spc = Space(context: context);
    final gapBetweenInputFields = spc.hghtRat(0.02);
    final confirmedPickupStatus = context.watch<ConfirmedPickupCubit>().state;
    final locationDetails = context.watch<LocationDetailsCubit>().state;
    addressController = TextEditingController(text: locationDetails.address);
    areaController = TextEditingController(text: locationDetails.area);
    stateController = TextEditingController(text: locationDetails.state);
    landmarkController = TextEditingController(text: locationDetails.landmark);
    cityController = TextEditingController(text: locationDetails.city);
    zipCodeController = TextEditingController(text: locationDetails.zipCode);
    countryController = TextEditingController(text: locationDetails.country);
    return Container(
      width: spc.wdRat(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 600),
            width: confirmedPickupStatus ? spc.wdRat(0.6) : spc.wdRat(0.77),
            height: 80,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: spc.hghtRat(0.03),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 6),
                                        child: !confirmedPickupStatus
                                            ? GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setPickedup();
                                                },
                                                child: Container(
                                                    width: spc.wdRat(0.3),
                                                    height: 24,
                                                    decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .verified_user_rounded,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 2,
                                                        ),
                                                        Text(
                                                          'Confirm Pickup',
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    )),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  // setState(() {
                                                  //   isConfirmedPickedUp =
                                                  //       !isConfirmedPickedUp;
                                                  // });
                                                  // context
                                                  //     .read<
                                                  //         FloatingIconStatusCubit>()
                                                  //     .toggleState();
                                                },
                                                child: CircleAvatar(
                                                  radius: 14,
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 3, 93, 158),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 13,
                                                  ),
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
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
                                                  stateNode.unfocus();
                                                  landmarkNode.unfocus();
                                                  cityNode.unfocus();
                                                  zipcodeNode.unfocus();
                                                  countryNode.unfocus();
                                                },
                                                child: Container(
                                                    height: spc.hghtRat(0.8),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        20))),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          spc.wdRat(0.05)),
                                                      child:
                                                          ListView(children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Location Pickup',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: spc
                                                              .hghtRat(0.025),
                                                        ),
                                                        TextField(
                                                          controller:
                                                              addressController,
                                                          focusNode:
                                                              addressNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Address',
                                                                  labelText:
                                                                      'Address',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setAddress(
                                                                    address:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              landmarkController,
                                                          focusNode:
                                                              landmarkNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Landmark',
                                                                  labelText:
                                                                      'Landmark',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setLandmark(
                                                                    landmark:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              areaController,
                                                          focusNode: areaNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Area',
                                                                  labelText:
                                                                      'Area',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setArea(
                                                                    area:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              cityController,
                                                          focusNode: cityNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'City',
                                                                  labelText:
                                                                      'City',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setCity(
                                                                    city:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              stateController,
                                                          focusNode: stateNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'State',
                                                                  labelText:
                                                                      'State',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setCity(
                                                                    city:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              zipCodeController,
                                                          focusNode:
                                                              zipcodeNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Zip Code',
                                                                  labelText:
                                                                      'Zip Code',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setZipCode(
                                                                    zipCode:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              gapBetweenInputFields,
                                                        ),
                                                        TextField(
                                                          controller:
                                                              countryController,
                                                          focusNode:
                                                              countryNode,
                                                          decoration:
                                                              InputDecoration(
                                                                  hintText:
                                                                      'Country',
                                                                  labelText:
                                                                      'Country',
                                                                  border:
                                                                      border,
                                                                  enabledBorder:
                                                                      border,
                                                                  focusedBorder:
                                                                      border),
                                                          onChanged: (value) {
                                                            context
                                                                .read<
                                                                    ConfirmedPickupCubit>()
                                                                .setNotPickedUp();
                                                            context
                                                                .read<
                                                                    LocationDetailsCubit>()
                                                                .setCountry(
                                                                    country:
                                                                        value);
                                                          },
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              spc.hghtRat(0.05),
                                                        ),
                                                        Align(
                                                          child: Container(
                                                            width:
                                                                spc.wdRat(0.6),
                                                            height: spc
                                                                .hghtRat(0.06),
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        3,
                                                                        93,
                                                                        158),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              'SUBMIT',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    )),
                                              );
                                            },
                                          );
                                        },
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Emmy Yost',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    width: spc.wdRat(0.2),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${locationDetails.city} ${locationDetails.address}',
                                                style: TextStyle(
                                                    fontSize: 6,
                                                    color: Color.fromARGB(
                                                        255, 138, 136, 136)),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: confirmedPickupStatus ? 28 : 10,
                                  ),
                                  // const AddIcon()

                                  // ElevatedButton(
                                  //     style: ButtonStyle(
                                  //         shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  //             borderRadius: BorderRadius.circular(20)))),
                                  //     onPressed: () {
                                  //       Scaffold.of(context).openEndDrawer();
                                  //     },
                                  //     child: Text('Load'))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: spc.wdRat(1),
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: spc.wdRat(0.04)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          // showLoadButton = !showLoadButton;
                          // isConfirmedPickedUp = !isConfirmedPickedUp;
                        });

                        // context.read<FloatingIconStatusCubit>().toggleState();
                        Scaffold.of(context).openDrawer();
                      },
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: Color.fromARGB(255, 149, 198, 238),
                        child: Image.asset('assets/images/boy_1.png'),
                      ),
                    ),
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
