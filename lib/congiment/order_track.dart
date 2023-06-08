import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/dash_board/dash_board.dart';

import '../dash_board/components/floating_icon_status_cubit.dart';
import '../dash_board/components/profile_header_reverse.dart';
import '../dash_board/drawer/bloc/location_details_cubit.dart';

class OrderTrack extends StatefulWidget {
  const OrderTrack({super.key});

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> with TickerProviderStateMixin {
  bool showFloatingProfile = false;
  String lat = '';
  String long = '';
  String? _currentAddress;

  late ScrollController scrollController;
  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (scrollController.offset > 71) {
        setState(() {
          showFloatingProfile = true;
        });
      }
    }
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (scrollController.offset < 71) {
        setState(() {
          showFloatingProfile = false;
        });
      }
    }
  }

  int tabIndex = 0;
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
  TextEditingController controller = TextEditingController();
  late TabController tabController;
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
    tabController = TabController(length: 3, vsync: this);
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
    final appColor = Color.fromARGB(255, 3, 93, 158);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return DashBoard();
                          },
                        ));
                      },
                      child: Icon(Icons.close)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spc.hghtRat(0.03)),
              child: Column(
                children: [
                  Container(
                    width: spc.wdRat(1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // showLoadButton = !showLoadButton;
                                  // isConfirmedPickedUp = false;
                                });
                                Scaffold.of(context).openEndDrawer();
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[100],
                                child: Image.asset(
                                  'assets/images/boy_1.png',
                                  height: 40,
                                ),
                                radius: 30.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
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
                                          height: spc.hghtRat(0.7),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20))),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(spc.wdRat(0.05)),
                                            child: ListView(children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Location Pickup',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: spc.hghtRat(0.025),
                                              ),
                                              TextField(
                                                controller: addressController,
                                                focusNode: addressNode,
                                                decoration: InputDecoration(
                                                    hintText: 'Address',
                                                    labelText: 'Address',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setAddress(
                                                          address: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: landmarkController,
                                                focusNode: landmarkNode,
                                                decoration: InputDecoration(
                                                    hintText: 'Landmark',
                                                    labelText: 'Landmark',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setLandmark(
                                                          landmark: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: areaController,
                                                focusNode: areaNode,
                                                decoration: InputDecoration(
                                                    hintText: 'Area',
                                                    labelText: 'Area',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setArea(area: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: cityController,
                                                focusNode: cityNode,
                                                decoration: InputDecoration(
                                                    hintText: 'City',
                                                    labelText: 'City',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setCity(city: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: stateController,
                                                focusNode: stateNode,
                                                decoration: InputDecoration(
                                                    hintText: 'State',
                                                    labelText: 'State',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setArea(area: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: zipCodeController,
                                                focusNode: zipcodeNode,
                                                decoration: InputDecoration(
                                                    hintText: 'Zip Code',
                                                    labelText: 'Zip Code',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setZipCode(
                                                          zipCode: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: gapBetweenInputFields,
                                              ),
                                              TextField(
                                                controller: countryController,
                                                focusNode: countryNode,
                                                decoration: InputDecoration(
                                                    hintText: 'Country',
                                                    labelText: 'Country',
                                                    border: border,
                                                    enabledBorder: border,
                                                    focusedBorder: border),
                                                onChanged: (value) {
                                                  context
                                                      .read<
                                                          ConfirmedPickupCubit>()
                                                      .setNotPickedUp();
                                                  context
                                                      .read<
                                                          LocationDetailsCubit>()
                                                      .setCountry(
                                                          country: value);
                                                },
                                                textInputAction:
                                                    TextInputAction.next,
                                              ),
                                              SizedBox(
                                                height: spc.hghtRat(0.05),
                                              ),
                                              Align(
                                                child: Container(
                                                  width: spc.wdRat(0.6),
                                                  height: spc.hghtRat(0.06),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Emmy Yost',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(width: 5),
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
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .location_on_outlined,
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
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      )),
                                                )
                                              : GestureDetector(
                                                  onTap: () => setState(() {
                                                    // isConfirmedPickedUp =
                                                    //     !isConfirmedPickedUp;
                                                  }),
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
                                        SizedBox(width: 5),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Text(
                                      '${locationDetails.city} ${locationDetails.address}',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color.fromARGB(
                                              255, 138, 136, 136)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 233, 230, 230),
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.notifications_outlined,
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: spc.hghtRat(0.02)),
                  Row(
                    children: [
                      Text('Track Your Package',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: spc.hghtRat(0.02)),
                  Container(
                    width: spc.wdRat(1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 150, 150, 150),
                              offset: Offset(0, 4),
                              blurRadius: 8)
                        ]),
                    child: Container(
                      child: AnimationSearchBar(
                          isBackButtonVisible: false,
                          backIconColor: Colors.black,
                          searchBarWidth: spc.wdRat(0.85),
                          centerTitle: 'Track Number',
                          centerTitleStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 114, 109, 109)),
                          onChanged: (text) => debugPrint(text),
                          searchTextEditingController: controller,
                          horizontalPadding: 5),
                    ),
                  ),
                  SizedBox(height: spc.hghtRat(0.06)),
                ],
              ),
            ),
            Container(
              width: spc.wdRat(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: spc.wdRat(0.93),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 233, 245),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: spc.hghtRat(0.02)),
                      child: TabBar(
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          // indicator: BoxDecoration(
                          //     color: const Color.fromARGB(255, 7, 106, 187),
                          //     borderRadius: BorderRadius.circular(10)),
                          controller: tabController,
                          onTap: (value) {
                            setState(() {
                              tabIndex = value;
                            });
                          },
                          tabs: [
                            Column(
                              children: [
                                Text(
                                  'Delivering',
                                  style: TextStyle(
                                      color: tabIndex == 0
                                          ? appColor
                                          : const Color.fromARGB(
                                              255, 141, 135, 135),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: tabIndex == 0
                                            ? appColor
                                            : Color.fromARGB(
                                                255, 219, 233, 245),
                                        borderRadius:
                                            BorderRadius.circular(100))),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Received',
                                  style: TextStyle(
                                      color: tabIndex == 1
                                          ? appColor
                                          : Color.fromARGB(255, 116, 113, 113),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: tabIndex == 1
                                            ? Colors.black
                                            : Color.fromARGB(
                                                255, 219, 233, 245),
                                        borderRadius:
                                            BorderRadius.circular(100))),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'All',
                                  style: TextStyle(
                                      color: tabIndex == 2
                                          ? appColor
                                          : Color.fromARGB(255, 116, 113, 113),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 4),
                                AnimatedContainer(
                                    duration: Duration(milliseconds: 600),
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                        color: tabIndex == 2
                                            ? Colors.black
                                            : Color.fromARGB(
                                                255, 219, 233, 245),
                                        borderRadius:
                                            BorderRadius.circular(100))),
                              ],
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(controller: tabController, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: spc.wdRat(0.93),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 233, 245),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: spc.hghtRat(0.02)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: spc.wdRat(0.85),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 197, 190, 190),
                                      offset: Offset(0, 0),
                                      blurRadius: 6)
                                ]),
                            child: Column(
                              children: [
                                SizedBox(height: spc.hghtRat(0.013)),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(width: spc.wdRat(0.01)),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                child: Icon(Icons.person)),
                                            SizedBox(width: spc.wdRat(0.03)),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Mauris Tempor Nibh Vel',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  SizedBox(height: 2),
                                                  Text('SDFLKSLDFDF',
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color.fromARGB(
                                                              255,
                                                              102,
                                                              100,
                                                              100))),
                                                ]),
                                          ],
                                        ),
                                        SizedBox(width: spc.wdRat(0.05)),
                                        Icon(Icons.more_vert)
                                      ]),
                                ),
                                SizedBox(height: spc.hghtRat(0.02)),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: spc.wdRat(0.18)),
                                    Column(children: [
                                      Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: appColor,
                                              borderRadius:
                                                  BorderRadius.circular(100))),
                                      Container(
                                        width: 1,
                                        height: spc.hghtRat(0.07),
                                        color: appColor,
                                      ),
                                      Container(
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border:
                                                  Border.all(color: appColor),
                                              borderRadius:
                                                  BorderRadius.circular(100))),
                                    ]),
                                    SizedBox(width: spc.wdRat(0.03)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(children: [
                                          Container(
                                              width: spc.wdRat(0.26),
                                              child: Text('From',
                                                  style: TextStyle(
                                                      color: appColor))),
                                          Text('Status',
                                              style:
                                                  TextStyle(color: appColor)),
                                        ]),
                                        SizedBox(height: 4),
                                        Row(children: [
                                          Container(
                                              width: spc.wdRat(0.26),
                                              child: Text('San Diego',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Text('On Way',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                        ]),
                                        SizedBox(height: spc.hghtRat(0.025)),
                                        Row(children: [
                                          Container(
                                              width: spc.wdRat(0.26),
                                              child: Text('To',
                                                  style: TextStyle(
                                                      color: appColor))),
                                          Text('Price',
                                              style:
                                                  TextStyle(color: appColor)),
                                        ]),
                                        SizedBox(height: 4),
                                        Row(children: [
                                          Container(
                                              width: spc.wdRat(0.26),
                                              child: Text('New York',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600))),
                                          Text('05:65:00',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600)),
                                        ]),
                                        SizedBox(height: spc.hghtRat(0.02)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: spc.wdRat(0.93),
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 233, 245),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20)),
                    ),
                  )
                ],
              ),
              Container(),
              Container(),
            ]))
          ]),
          if (showFloatingProfile)
            Positioned(
              top: spc.hghtRat(0.84),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const ProfileHeaderReverse(),
              ),
            ).animate().fade(),
        ],
      ),
    );
  }
}
