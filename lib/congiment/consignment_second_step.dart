import 'dart:io';

import 'package:chips_input/chips_input.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../core/utils.dart';
import 'bloc/congiment_page_change_cubit.dart';

class AppProfile {
  final String name;
  final String email;
  final String imageUrl;

  const AppProfile(this.name, this.email, this.imageUrl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppProfile &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name;
  }
}

const mockResults = <AppProfile>[
  AppProfile('John Doe', 'jdoe@flutter.io',
      'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX4057996.jpg'),
  AppProfile('Paul', 'paul@google.com',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Fred', 'fred@google.com',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Brian', 'brian@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('John', 'john@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Thomas', 'thomas@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Nelly', 'nelly@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Marie', 'marie@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Charlie', 'charlie@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Diana', 'diana@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Ernie', 'ernie@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
  AppProfile('Gina', 'fred@flutter.io',
      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png'),
];

class ConsignmentSecondStep extends StatefulWidget {
  const ConsignmentSecondStep({super.key});

  @override
  State<ConsignmentSecondStep> createState() => _ConsignmentSecondStepState();
}

class _ConsignmentSecondStepState extends State<ConsignmentSecondStep> {
  FocusNode addressNode = FocusNode();
  FocusNode areaNode = FocusNode();
  FocusNode landmarkNode = FocusNode();
  FocusNode cityNode = FocusNode();
  FocusNode zipcodeNode = FocusNode();
  FocusNode countryNode = FocusNode();
  bool showLoadButton = true;
  bool isConfirmedPickedUp = false;
  late AnimationController controller;
  double sliderValue = 0.0;
  bool switchSlabValue = true;
  bool switchSelectBoxSplitValue = true;
  bool switchDestinationSplitValue = true;
  bool switchSelfDropValue = true;
  bool switchSelfDropOffValue = true;

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));

    final gapBetweenInputFields = spc.hghtRat(0.02);
    const appColor = Color.fromARGB(255, 3, 93, 158);
    final boxShadow = [
      const BoxShadow(
          color: Color.fromARGB(255, 151, 147, 147),
          offset: Offset(0, 0),
          blurRadius: 10)
    ];
    final boxGap = spc.hghtRat(0.03);
    return Stack(
      children: [
        Column(children: [
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: const Color.fromARGB(255, 177, 172, 172)),
                // borderRadius: BorderRadius.circular(10),
                // boxShadow: boxShadow,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: spc.wdRat(0.04), vertical: spc.hghtRat(0.028)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Select Box/Cover Size',
                          style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 3, 93, 158),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 10, right: 10),
                          child: GestureDetector(
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
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20))),
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(spc.wdRat(0.05)),
                                          child: ListView(children: [
                                            Row(
                                              children: const [
                                                Text(
                                                  'Boxes',
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: appColor),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: spc.hghtRat(0.025),
                                            ),
                                            for (var i = 0; i < 2; i++)
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      gapBetweenInputFields,
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: Color.fromARGB(
                                                              255,
                                                              197,
                                                              223,
                                                              245)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Image.asset(
                                                                  'assets/images/box_measure.png',
                                                                  height: 80),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    'Max Load 35 kg',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red,
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                              ),
                                                              const SizedBox(
                                                                  height: 20),
                                                              Icon(
                                                                Icons.edit,
                                                                size: 18,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            ],
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                            Align(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  width: spc.wdRat(0.6),
                                                  height: spc.hghtRat(0.06),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 3, 93, 158),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  alignment: Alignment.center,
                                                  child: const Text(
                                                    'SUBMIT',
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                            child: Container(
                                width: spc.wdRat(1),
                                height: spc.hghtRat(0.08),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Box 12x24',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 3, 93, 158)),
                                      ),
                                      Icon(Icons.arrow_drop_down),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 20),
                          child: Container(
                            color: Colors.white,
                            child: Text(
                              'Stock account',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Package Split By Box',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 122, 119, 119),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              value: switchSelectBoxSplitValue,
                              activeColor: const Color(0xFF6200EE),
                              onChanged: (bool value) {
                                setState(() {
                                  switchSelectBoxSplitValue = value;
                                });
                              },
                            ),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Split Destination Address By Package',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 122, 119, 119),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                          Transform.scale(
                            scale: 0.7,
                            child: Switch(
                              value: switchDestinationSplitValue,
                              activeColor: const Color(0xFF6200EE),
                              onChanged: (bool value) {
                                setState(() {
                                  switchDestinationSplitValue = value;
                                });
                              },
                            ),
                          )
                        ]),
                    Text('Selected Package',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    for (var i = 0; i < 2; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: gapBetweenInputFields,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color.fromARGB(255, 107, 102, 102)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text('Max Load 35 kg',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 3, 93, 158),
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          Image.asset(
                                              'assets/images/box_measure.png',
                                              height: 80),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const CircleAvatar(
                                              radius: 18,
                                              backgroundColor: Colors.red,
                                              child: Icon(
                                                Icons.delete_outline,
                                                size: 18,
                                                color: Colors.white,
                                              )),
                                          const SizedBox(height: 20),
                                          GestureDetector(
                                            onTap: () {
                                              showModalBottomSheet(
                                                context: context,
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
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
                                                        height:
                                                            spc.hghtRat(0.7),
                                                        decoration: const BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius.vertical(
                                                                    top: Radius
                                                                        .circular(
                                                                            20))),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(spc
                                                                  .wdRat(0.05)),
                                                          child: ListView(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: const [
                                                                    Text(
                                                                      'Pick any One',
                                                                      style: TextStyle(
                                                                          decoration: TextDecoration
                                                                              .underline,
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              appColor),
                                                                    ),
                                                                    Text(
                                                                      'Add',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          color:
                                                                              appColor),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: spc
                                                                      .hghtRat(
                                                                          0.025),
                                                                ),
                                                                for (var i = 0;
                                                                    i < 2;
                                                                    i++)
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          gapBetweenInputFields,
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .white,
                                                                          border: Border.all(
                                                                              color: const Color.fromARGB(255, 197, 223,
                                                                                  245)),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child: Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              const SizedBox(width: 15),
                                                                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                                                                                SizedBox(height: 8),
                                                                                Text(
                                                                                  'Tony Pattichai',
                                                                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                                                                ),
                                                                                SizedBox(height: 4),
                                                                                Text(
                                                                                  'Los Angeles, California, USA',
                                                                                  style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
                                                                                ),
                                                                                SizedBox(height: 8),
                                                                              ]),
                                                                              SizedBox(
                                                                                width: spc.wdRat(0.14),
                                                                              ),
                                                                              const Padding(
                                                                                padding: EdgeInsets.only(bottom: 10),
                                                                                child: Icon(
                                                                                  Icons.edit,
                                                                                  size: 18,
                                                                                ),
                                                                              ),
                                                                              const SizedBox(width: 10),
                                                                              Padding(
                                                                                padding: EdgeInsets.only(top: spc.hghtRat(0.04)),
                                                                                child: const CircleAvatar(
                                                                                    radius: 12,
                                                                                    backgroundColor: Colors.blue,
                                                                                    child: Icon(
                                                                                      Icons.check,
                                                                                      size: 12,
                                                                                    )),
                                                                              )
                                                                            ]),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                Align(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: spc
                                                                          .wdRat(
                                                                              0.6),
                                                                      height: spc
                                                                          .hghtRat(
                                                                              0.06),
                                                                      decoration: BoxDecoration(
                                                                          color: const Color.fromARGB(
                                                                              255,
                                                                              3,
                                                                              93,
                                                                              158),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          const Text(
                                                                        'SUBMIT',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white),
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
                                            child: Text('Add Address',
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 3, 93, 158),
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ],
                                      ),
                                    ]),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: gapBetweenInputFields,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 237, 240, 243),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Tony Pattichai',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Los Angeles, California, USA',
                                                    style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 104, 98, 98),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ]),
                                            SizedBox(
                                              width: spc.wdRat(0.14),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 177, 172, 172)),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: spc.wdRat(0.04),
                                          vertical: spc.hghtRat(0.028)),
                                      child: Column(children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                'Product Info',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 121, 117, 117),
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          addressNode.unfocus();
                                                          areaNode.unfocus();
                                                          landmarkNode
                                                              .unfocus();
                                                          cityNode.unfocus();
                                                          zipcodeNode.unfocus();
                                                          countryNode.unfocus();
                                                        },
                                                        child: Container(
                                                            height: spc
                                                                .hghtRat(0.7),
                                                            decoration: const BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .vertical(
                                                                            top:
                                                                                Radius.circular(20))),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets.all(
                                                                      spc.wdRat(
                                                                          0.05)),
                                                              child: ListView(
                                                                  children: [
                                                                    Row(
                                                                      children: const [
                                                                        Text(
                                                                          'Add Items List',
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: appColor),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height: spc
                                                                          .hghtRat(
                                                                              0.025),
                                                                    ),
                                                                    SizedBox(
                                                                      height: spc
                                                                          .hghtRat(
                                                                              0.09),
                                                                      child:
                                                                          ChipsInput(
                                                                        focusNode:
                                                                            addressNode,
                                                                        decoration: InputDecoration(
                                                                            hintText:
                                                                                'Item Name',
                                                                            border:
                                                                                border,
                                                                            enabledBorder:
                                                                                border,
                                                                            focusedBorder:
                                                                                border),
                                                                        textInputAction:
                                                                            TextInputAction.next,
                                                                        maxChips:
                                                                            3, // remove, if you like infinity number of chips

                                                                        findSuggestions:
                                                                            (String
                                                                                query) {
                                                                          if (query
                                                                              .isNotEmpty) {
                                                                            var lowercaseQuery =
                                                                                query.toLowerCase();
                                                                            final results = mockResults.where((profile) {
                                                                              return profile.name.toLowerCase().contains(query.toLowerCase()) || profile.email.toLowerCase().contains(query.toLowerCase());
                                                                            }).toList(growable: false)
                                                                              ..sort((a, b) => a.name.toLowerCase().indexOf(lowercaseQuery).compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)));
                                                                            return results;
                                                                          }
                                                                          return mockResults;
                                                                        },
                                                                        onChanged:
                                                                            (data) {
                                                                          print(
                                                                              data);
                                                                        },
                                                                        chipBuilder: (context,
                                                                            state,
                                                                            AppProfile
                                                                                profile) {
                                                                          return InputChip(
                                                                            deleteIcon: CircleAvatar(
                                                                                backgroundColor: Colors.black,
                                                                                radius: 25,
                                                                                child: Icon(Icons.close, size: 12, color: Colors.white)),
                                                                            key:
                                                                                ObjectKey(profile),
                                                                            label:
                                                                                Text(profile.name),
                                                                            avatar:
                                                                                CircleAvatar(
                                                                              backgroundImage: NetworkImage(profile.imageUrl),
                                                                            ),
                                                                            onDeleted: () =>
                                                                                state.deleteChip(profile),
                                                                            materialTapTargetSize:
                                                                                MaterialTapTargetSize.shrinkWrap,
                                                                          );
                                                                        },

                                                                        optionsViewBuilder: (context,
                                                                            onSelected,
                                                                            options) {
                                                                          return Align(
                                                                            alignment:
                                                                                Alignment.topLeft,
                                                                            child:
                                                                                Material(
                                                                              elevation: 4.0,
                                                                              child: Container(
                                                                                height: 200.0,
                                                                                child: ListView.builder(
                                                                                  padding: EdgeInsets.all(8.0),
                                                                                  itemCount: options.length,
                                                                                  itemBuilder: (BuildContext context, int index) {
                                                                                    final option = options.elementAt(index);
                                                                                    return GestureDetector(
                                                                                      onTap: () {
                                                                                        onSelected(option);
                                                                                      },
                                                                                      child: ListTile(
                                                                                        key: ObjectKey(option),
                                                                                        leading: CircleAvatar(
                                                                                          backgroundImage: NetworkImage(option.imageUrl),
                                                                                        ),
                                                                                        title: Text(option.name),
                                                                                        subtitle: Text(option.email),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    TextField(
                                                                      focusNode:
                                                                          addressNode,
                                                                      decoration: InputDecoration(
                                                                          hintText:
                                                                              'Item Value',
                                                                          labelText:
                                                                              'Item Value',
                                                                          border:
                                                                              border,
                                                                          enabledBorder:
                                                                              border,
                                                                          focusedBorder:
                                                                              border),
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Row(
                                                                      children: const [
                                                                        Text(
                                                                            'Add on image or file'),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Align(
                                                                          child:
                                                                              DottedBorder(
                                                                            color:
                                                                                Colors.black,
                                                                            strokeWidth:
                                                                                1,
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.16), vertical: spc.hghtRat(0.04)),
                                                                              child: Icon(Icons.photo),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                spc.wdRat(0.05)),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () async {
                                                                            FilePickerResult?
                                                                                result =
                                                                                await FilePicker.platform.pickFiles();

                                                                            if (result !=
                                                                                null) {
                                                                              File file = File(result.files.single.path!);
                                                                              print(file);
                                                                            } else {
                                                                              // User canceled the picker
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                spc.hghtRat(0.06),
                                                                            decoration:
                                                                                BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(width: spc.wdRat(0.05)),
                                                                                const Text(
                                                                                  'Choose file',
                                                                                  style: TextStyle(color: Colors.white),
                                                                                ),
                                                                                SizedBox(width: spc.wdRat(0.05)),
                                                                                Icon(Icons.description, color: Colors.white),
                                                                                SizedBox(width: spc.wdRat(0.05)),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Align(
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              spc.wdRat(0.5),
                                                                          height:
                                                                              spc.hghtRat(0.06),
                                                                          decoration: BoxDecoration(
                                                                              color: const Color.fromARGB(255, 3, 93, 158),
                                                                              borderRadius: BorderRadius.circular(10)),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              const Text(
                                                                            'Submit',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
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
                                                child: const Text(
                                                  'Add',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158)),
                                                ),
                                              )
                                            ]),
                                        const SizedBox(height: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 158, 155, 155)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 14, vertical: 8),
                                            child: Column(
                                              children: [
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: const [
                                                            SizedBox(
                                                                height: 10),
                                                            Text(
                                                              'Dark Compound',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(height: 4),
                                                            Text(
                                                              'Qty 36',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                          ]),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      const Icon(
                                                        Icons.edit,
                                                        size: 18,
                                                      ),
                                                      const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                        size: 18,
                                                      )
                                                    ]),
                                              ],
                                            ),
                                          ),
                                        )
                                      ]),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: spc.hghtRat(0.1)),
                  ],
                ),
              )),
        ]),
      ],
    );
  }
}
