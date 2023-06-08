import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xoomship/congiment/price_level.dart';

import '../core/utils.dart';
import 'bloc/congiment_page_change_cubit.dart';
import 'my_order.dart';

class ConsignmentThirdStep extends StatefulWidget {
  const ConsignmentThirdStep({super.key});

  @override
  State<ConsignmentThirdStep> createState() => _ConsignmentThirdStepState();
}

class _ConsignmentThirdStepState extends State<ConsignmentThirdStep> {
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
  int nearestDropOffValue = 1;
  int pickAnyOneValue = 3;

  int paymentOptionValue = 0;

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
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: spc.wdRat(0.02), vertical: spc.hghtRat(0.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //     color: const Color.fromARGB(255, 177, 172, 172)),
              // borderRadius: BorderRadius.circular(10),
              // boxShadow: boxShadow,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: spc.wdRat(0.04), vertical: spc.hghtRat(0.028)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Receiver Name & Contact Number',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 3, 93, 158),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
                        width: spc.wdRat(1),
                        height: 70,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Mr. Sundram Aryan',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: appColor),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '+1 980 2349 789',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: appColor),
                                    ),
                                  ]),
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
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20))),
                                            child: Padding(
                                              padding: EdgeInsets.all(
                                                  spc.wdRat(0.05)),
                                              child: ListView(children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      'Receiver Details',
                                                      style: TextStyle(
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
                                                TextField(
                                                  focusNode: addressNode,
                                                  decoration: InputDecoration(
                                                      hintText: 'Relation Type',
                                                      labelText:
                                                          'Relation Type',
                                                      border: border,
                                                      enabledBorder: border,
                                                      focusedBorder: border),
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                                SizedBox(
                                                  height: gapBetweenInputFields,
                                                ),
                                                TextField(
                                                  focusNode: areaNode,
                                                  decoration: InputDecoration(
                                                      hintText: 'Full Name',
                                                      labelText:
                                                          'Relation Full Name',
                                                      border: border,
                                                      enabledBorder: border,
                                                      focusedBorder: border),
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                                SizedBox(
                                                  height: gapBetweenInputFields,
                                                ),
                                                TextField(
                                                  focusNode: landmarkNode,
                                                  decoration: InputDecoration(
                                                      hintText: 'Mobile Number',
                                                      labelText:
                                                          'Mobile Number',
                                                      border: border,
                                                      enabledBorder: border,
                                                      focusedBorder: border),
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                                SizedBox(
                                                  height: gapBetweenInputFields,
                                                ),
                                                TextField(
                                                  focusNode: cityNode,
                                                  decoration: InputDecoration(
                                                      hintText: 'Email Id',
                                                      labelText: 'Email Id',
                                                      border: border,
                                                      enabledBorder: border,
                                                      focusedBorder: border),
                                                  textInputAction:
                                                      TextInputAction.next,
                                                ),
                                                SizedBox(
                                                  height: gapBetweenInputFields,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text('Add on image or file',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                    Text('Upload ID',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.red,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600)),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  children: [
                                                    Align(
                                                      child: DottedBorder(
                                                        color: Colors.black,
                                                        strokeWidth: 1,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      spc.wdRat(
                                                                          0.16),
                                                                  vertical: spc
                                                                      .hghtRat(
                                                                          0.04)),
                                                          child:
                                                              Icon(Icons.photo),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: spc.wdRat(0.05)),
                                                    Container(
                                                      height: spc.hghtRat(0.06),
                                                      decoration: BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                              width: spc
                                                                  .wdRat(0.05)),
                                                          const Text(
                                                            'Choose file',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          SizedBox(
                                                              width: spc
                                                                  .wdRat(0.05)),
                                                          Icon(
                                                              Icons.description,
                                                              color:
                                                                  Colors.white),
                                                          SizedBox(
                                                              width: spc
                                                                  .wdRat(0.05)),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Align(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      width: spc.wdRat(0.5),
                                                      height: spc.hghtRat(0.06),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                                  .fromARGB(
                                                              255, 3, 93, 158),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'Submit',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            )),
                                      );
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.add,
                                  size: 30,
                                  color: appColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Receiver Address',
                          style: TextStyle(
                              color: Color.fromARGB(255, 121, 117, 117),
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
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
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top:
                                                          Radius.circular(20))),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(spc.wdRat(0.05)),
                                            child: ListView(children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: const [
                                                  Text(
                                                    'Pick any One',
                                                    style: TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: appColor),
                                                  ),
                                                  Text(
                                                    'Add',
                                                    style: TextStyle(
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
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                197,
                                                                223,
                                                                245)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        237,
                                                                        240,
                                                                        243),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const SizedBox(
                                                                      width:
                                                                          15),
                                                                  Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: const [
                                                                        SizedBox(
                                                                            height:
                                                                                8),
                                                                        Text(
                                                                          'Tony Pattichai',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        Text(
                                                                          'Los Angeles, California, USA',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                8),
                                                                      ]),
                                                                  SizedBox(
                                                                    width: spc
                                                                        .wdRat(
                                                                            0.14),
                                                                  ),
                                                                  const SizedBox(
                                                                      width:
                                                                          10),
                                                                ]),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: spc
                                                                        .hghtRat(
                                                                            0.04)),
                                                            child: Radio(
                                                              value: i,
                                                              groupValue:
                                                                  pickAnyOneValue,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  pickAnyOneValue =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
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
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 3, 93, 158),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
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
                            );
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 3, 93, 158)),
                          ),
                        )
                      ]),
                  SizedBox(height: 10),
                  for (var i = 0; i < 2; i++)
                    Container(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(Icons.location_on,
                                    color:
                                        i == 0 ? Colors.orange : Colors.blue),
                                if (i != 1)
                                  for (var j = 0; j < 4; j++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      child: Container(
                                        width: 2,
                                        height: 10,
                                        color:
                                            Color.fromARGB(255, 185, 183, 183),
                                      ),
                                    )
                              ],
                            ),
                            SizedBox(
                              width: spc.wdRat(0.05),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 237, 240, 243),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Los Angeles, California, USA',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ]),
                                    SizedBox(
                                      width: spc.wdRat(0.19),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: Icon(
                                        Icons.edit,
                                        size: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Book For Others',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
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
                  Container(
                    width: spc.wdRat(1),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(spc.wdRat(0.02)),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sender Address',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
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
                                            landmarkNode.unfocus();
                                            cityNode.unfocus();
                                            zipcodeNode.unfocus();
                                            countryNode.unfocus();
                                          },
                                          child: Container(
                                              height: spc.hghtRat(0.7),
                                              decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                          top: Radius.circular(
                                                              20))),
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    spc.wdRat(0.05)),
                                                child: ListView(children: [
                                                  Row(
                                                    children: const [
                                                      Text(
                                                        'Sender Details',
                                                        style: TextStyle(
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
                                                  TextField(
                                                    focusNode: addressNode,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'Relation Type',
                                                        labelText:
                                                            'Relation Type',
                                                        border: border,
                                                        enabledBorder: border,
                                                        focusedBorder: border),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        gapBetweenInputFields,
                                                  ),
                                                  TextField(
                                                    focusNode: areaNode,
                                                    decoration: InputDecoration(
                                                        hintText: 'Full Name',
                                                        labelText:
                                                            'Relation Full Name',
                                                        border: border,
                                                        enabledBorder: border,
                                                        focusedBorder: border),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        gapBetweenInputFields,
                                                  ),
                                                  TextField(
                                                    focusNode: landmarkNode,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            'Mobile Number',
                                                        labelText:
                                                            'Mobile Number',
                                                        border: border,
                                                        enabledBorder: border,
                                                        focusedBorder: border),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        gapBetweenInputFields,
                                                  ),
                                                  TextField(
                                                    focusNode: cityNode,
                                                    decoration: InputDecoration(
                                                        hintText: 'Email Id',
                                                        labelText: 'Email Id',
                                                        border: border,
                                                        enabledBorder: border,
                                                        focusedBorder: border),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                  ),
                                                  SizedBox(
                                                    height:
                                                        gapBetweenInputFields,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: const [
                                                      Text(
                                                          'Add on image or file',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                      Text('Upload ID',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Align(
                                                        child: DottedBorder(
                                                          color: Colors.black,
                                                          strokeWidth: 1,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        spc.wdRat(
                                                                            0.16),
                                                                    vertical: spc
                                                                        .hghtRat(
                                                                            0.04)),
                                                            child: Icon(
                                                                Icons.photo),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              spc.wdRat(0.05)),
                                                      Container(
                                                        height:
                                                            spc.hghtRat(0.06),
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        alignment:
                                                            Alignment.center,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                                width:
                                                                    spc.wdRat(
                                                                        0.05)),
                                                            const Text(
                                                              'Choose file',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            SizedBox(
                                                                width:
                                                                    spc.wdRat(
                                                                        0.05)),
                                                            Icon(
                                                                Icons
                                                                    .description,
                                                                color: Colors
                                                                    .white),
                                                            SizedBox(
                                                                width:
                                                                    spc.wdRat(
                                                                        0.05)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Align(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        width: spc.wdRat(0.5),
                                                        height:
                                                            spc.hghtRat(0.06),
                                                        decoration: BoxDecoration(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                3,
                                                                93,
                                                                158),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        alignment:
                                                            Alignment.center,
                                                        child: const Text(
                                                          'Submit',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]),
                                              )),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    'Upload Support Document',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ]),
                          SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 237, 240, 243),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            'Los Angeles, California, USA',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
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
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                      width: spc.wdRat(1),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text('Your Total Consignment Charges:',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 3, 93, 158),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 5),
                          Text('62,725.00',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: 10),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
