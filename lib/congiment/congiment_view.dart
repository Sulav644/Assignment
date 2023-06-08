import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:xoomship/congiment/price_level.dart';

import '../core/utils.dart';
import '../dash_board/dash_board.dart';
import 'bloc/congiment_page_change_cubit.dart';
import 'congiment_page.dart';
import 'consignment_first_step.dart';
import 'consignment_second_step.dart';
import 'consignment_third_step.dart';
import 'my_order.dart';

class ConsignmentView extends StatefulWidget {
  const ConsignmentView({super.key});

  @override
  State<ConsignmentView> createState() => _ConsignmentViewState();
}

class _ConsignmentViewState extends State<ConsignmentView> {
  double sliderValue = 0.0;
  bool switchSlabValue = true;
  bool switchSelectBoxSplitValue = true;
  bool switchDestinationSplitValue = true;
  bool switchSelfDropValue = true;
  bool switchSelfDropOffValue = true;
  int nearestDropOffValue = 2;
  bool checkedSelfDrop = false;

  int paymentOptionValue = 3;

  bool isFinished = false;
  final pages = [
    ConsignmentFirstStep(),
    ConsignmentSecondStep(),
    ConsignmentThirdStep()
  ];
  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));

    final gapBetweenInputFields = spc.hghtRat(0.02);
    final cmp = Components();
    const appColor = Color.fromARGB(255, 3, 93, 158);
    final boxShadow = [
      const BoxShadow(
          color: Color.fromARGB(255, 151, 147, 147),
          offset: Offset(0, 0),
          blurRadius: 10)
    ];
    final boxGap = spc.hghtRat(0.03);
    final pageState = context.watch<CongimentPageChangeCubit>().state;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (pageState > 0) {
                context.read<CongimentPageChangeCubit>().previousPage();
              } else {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return DashBoard();
                  },
                ));
              }
            },
            icon: Icon(Icons.arrow_back)),
        title: Text(
          'Consignment Booking',
          style: TextStyle(
              color: appColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (pageState != 0 && pageState != 2)
                              Row(
                                children: [
                                  const Text(
                                    "65",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2),
                                    child: const Text(
                                      "/kg",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (pageState == 2)
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 15,
                                      child: const Icon(Icons.check, size: 18)),
                                  SizedBox(width: spc.wdRat(0.03)),
                                  CircleAvatar(
                                      radius: 15,
                                      backgroundColor: Colors.blue,
                                      child: const Icon(Icons.person_outline,
                                          size: 18, color: Colors.white)),
                                ],
                              ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 600),
                              width: (() {
                                if (pageState == 0) {
                                  return 0.toDouble();
                                } else if (pageState == 2) {
                                  return spc.wdRat(0.3).toDouble();
                                } else {
                                  return spc.wdRat(0.24).toDouble();
                                }
                              }()),
                            ),
                            Transform.rotate(
                                angle: 90 / 180 * pi,
                                child: Icon(
                                  Icons.flight,
                                  color: Color.fromARGB(255, 112, 108, 108),
                                )),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: spc.wdRat(0.015)),
                          child: Row(
                            children: [
                              if (pageState == 2)
                                Row(
                                  children: [
                                    const Text(
                                      "65",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 90, 88, 88)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: const Text(
                                        "/kg",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 90, 88, 88)),
                                      ),
                                    ),
                                  ],
                                ),
                              if (pageState != 2)
                                Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 112, 108, 108)),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.person,
                                        color:
                                            Color.fromARGB(255, 112, 108, 108),
                                        size: 18,
                                      ),
                                    )),
                              SizedBox(width: spc.wdRat(0.04)),
                              Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 112, 108, 108)),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      size: 18,
                                      color: Color.fromARGB(255, 112, 108, 108),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          width: (() {
                            if (pageState != 2) {
                              return spc.wdRat(0.7);
                            } else {
                              return spc.wdRat(0.09);
                            }
                          }()),
                          height: 4,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 231, 236),
                              borderRadius: BorderRadius.circular(100)),
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            width: (() {
                              if (pageState != 2) {
                                return spc.wdRat(0.8) / 2;
                              } else {
                                return spc.wdRat(0.09);
                              }
                            }()),
                            decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          width: (() {
                            if (pageState != 2) {
                              return spc.wdRat(0.08);
                            } else {
                              return spc.wdRat(0.7);
                            }
                          }()),
                          height: 4,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 231, 236),
                              borderRadius: BorderRadius.circular(100)),
                          alignment: Alignment.centerLeft,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            width: (() {
                              if (pageState != 2) {
                                return 0.toDouble();
                              } else {
                                return spc.wdRat(0.7) / 1.5;
                              }
                            }()),
                            decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          width: spc.wdRat(0.08),
                          height: 4,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 226, 231, 236),
                              borderRadius: BorderRadius.circular(100)),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 0,
                            decoration: BoxDecoration(
                                color: appColor,
                                borderRadius: BorderRadius.circular(100)),
                          ),
                        ),
                      ]),
                ),
                pages[pageState],
              ]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Transform.scale(
                    scale: 0.9,
                    child: SwipeableButtonView(
                        buttonText:
                            pageState == 2 ? 'Pay and Book Now' : 'Next',
                        buttontextstyle:
                            TextStyle(fontSize: 16, color: Colors.white),
                        buttonWidget: Transform.rotate(
                            angle: 90 / 180 * pi,
                            child: Icon(Icons.flight, color: appColor)),
                        activeColor: appColor,
                        isFinished: isFinished,
                        onWaitingProcess: () {
                          setState(() {
                            isFinished = true;
                          });
                        },
                        onFinish: () async {
                          setState(() {
                            isFinished = false;
                          });
                          if (pageState != 2) {
                            context
                                .read<CongimentPageChangeCubit>()
                                .changePage();
                          } else {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                        height: spc.hghtRat(0.8),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: const Color.fromARGB(
                                                    255, 177, 172, 172)),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: boxShadow),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: spc.wdRat(0.04),
                                          ),
                                          child: SingleChildScrollView(
                                            child: Column(children: [
                                              const SizedBox(height: 10),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    Text(
                                                      'Package Summary',
                                                      style: TextStyle(
                                                          color: appColor,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ]),
                                              SizedBox(
                                                  height: spc.hghtRat(0.02)),
                                              Column(
                                                children: [
                                                  PriceLevel(
                                                      title:
                                                          'Total Weight In Kg',
                                                      price: '65'),
                                                  PriceLevel(
                                                      title: 'Price Per Kg',
                                                      price: '965.00'),
                                                  PriceLevel(
                                                      title:
                                                          'Total Gross Amount',
                                                      price: '62,725.00'),
                                                  PriceLevel(
                                                      title:
                                                          'Total Tax GST 18%',
                                                      price: '11,290.5'),
                                                  PriceLevel(
                                                      title: 'Total Amount',
                                                      price: '74,015.5'),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                226,
                                                                221,
                                                                221)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Self Drop Off',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                              Checkbox(
                                                                value:
                                                                    checkedSelfDrop,
                                                                onChanged:
                                                                    (value) async {
                                                                  setState(
                                                                    () {
                                                                      checkedSelfDrop =
                                                                          value!;
                                                                    },
                                                                  );
                                                                  if (checkedSelfDrop) {
                                                                    final nearestDropPoint =
                                                                        await showModalBottomSheet<
                                                                            int>(
                                                                      context:
                                                                          context,
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      builder:
                                                                          (context) {
                                                                        return StatefulBuilder(
                                                                          builder:
                                                                              (context, setState) {
                                                                            return GestureDetector(
                                                                              onTap: () {},
                                                                              child: Container(
                                                                                  height: spc.hghtRat(0.7),
                                                                                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(spc.wdRat(0.05)),
                                                                                    child: ListView(children: [
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: const [
                                                                                          Text(
                                                                                            'Nearest Drop Off',
                                                                                            style: TextStyle(decoration: TextDecoration.underline, fontSize: 18, fontWeight: FontWeight.w600, color: appColor),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: spc.hghtRat(0.025),
                                                                                      ),
                                                                                      for (var i = 0; i < 2; i++)
                                                                                        Padding(
                                                                                          padding: EdgeInsets.symmetric(
                                                                                            vertical: gapBetweenInputFields,
                                                                                          ),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color.fromARGB(255, 197, 223, 245)), borderRadius: BorderRadius.circular(10)),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsets.all(8.0),
                                                                                              child: Row(
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    decoration: BoxDecoration(color: Color.fromARGB(255, 237, 240, 243), borderRadius: BorderRadius.circular(10)),
                                                                                                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                                                                                      const SizedBox(width: 10),
                                                                                                    ]),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsets.only(top: spc.hghtRat(0.04)),
                                                                                                    child: Radio(
                                                                                                      value: i,
                                                                                                      groupValue: nearestDropOffValue,
                                                                                                      onChanged: (value) {
                                                                                                        setState(
                                                                                                          () {
                                                                                                            nearestDropOffValue = value!;
                                                                                                          },
                                                                                                        );
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
                                                                                            Navigator.of(context).pop(nearestDropOffValue);
                                                                                          },
                                                                                          child: Container(
                                                                                            width: spc.wdRat(0.6),
                                                                                            height: spc.hghtRat(0.06),
                                                                                            decoration: BoxDecoration(color: const Color.fromARGB(255, 3, 93, 158), borderRadius: BorderRadius.circular(10)),
                                                                                            alignment: Alignment.center,
                                                                                            child: const Text(
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
                                                                    );
                                                                    setState(
                                                                      () {
                                                                        nearestDropOffValue =
                                                                            nearestDropPoint!;
                                                                      },
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          if (nearestDropOffValue <
                                                              2)
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                vertical:
                                                                    gapBetweenInputFields,
                                                              ),
                                                              child: Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            197,
                                                                            223,
                                                                            245)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                237,
                                                                                240,
                                                                                243),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
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
                                                                              const SizedBox(width: 10),
                                                                            ]),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Choose Your Payment Option',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                226,
                                                                221,
                                                                221)),
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Text(
                                                              'POP(Pickup On Pay)',
                                                              style: TextStyle(
                                                                  color: checkedSelfDrop
                                                                      ? Color.fromARGB(
                                                                          255,
                                                                          100,
                                                                          97,
                                                                          97)
                                                                      : Colors
                                                                          .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: spc
                                                                        .wdRat(
                                                                            0.01)),
                                                            child: Radio(
                                                              value:
                                                                  !checkedSelfDrop
                                                                      ? 0
                                                                      : 3,
                                                              groupValue:
                                                                  paymentOptionValue,
                                                              onChanged:
                                                                  (value) {
                                                                print('hello');
                                                                if (!checkedSelfDrop) {
                                                                  setState(() {
                                                                    paymentOptionValue =
                                                                        value!;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                226,
                                                                221,
                                                                221)),
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Text(
                                                              'Pay Now',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: spc
                                                                        .wdRat(
                                                                            0.01)),
                                                            child: Radio(
                                                              value: 1,
                                                              groupValue:
                                                                  paymentOptionValue,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  paymentOptionValue =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                226,
                                                                221,
                                                                221)),
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
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 8),
                                                            child: Text(
                                                              'Pay At Counter',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: spc
                                                                        .wdRat(
                                                                            0.01)),
                                                            child: Radio(
                                                              value: 2,
                                                              groupValue:
                                                                  paymentOptionValue,
                                                              onChanged:
                                                                  (value) {
                                                                setState(() {
                                                                  paymentOptionValue =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Align(
                                                    child: GestureDetector(
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                                content:
                                                                    SingleChildScrollView(
                                                              child: Column(
                                                                  children: [
                                                                    GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: const [
                                                                            Icon(Icons.close),
                                                                          ],
                                                                        )),
                                                                    const Text(
                                                                        'Consignment Booked',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    SizedBox(
                                                                        height:
                                                                            spc.hghtRat(0.05)),
                                                                    Image.asset(
                                                                        'assets/images/task_note.png',
                                                                        height:
                                                                            spc.hghtRat(0.1)),
                                                                    SizedBox(
                                                                        height:
                                                                            spc.hghtRat(0.05)),
                                                                    const Text(
                                                                        'Your Order has been Booked',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                    SizedBox(
                                                                        height:
                                                                            spc.hghtRat(0.01)),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: const [
                                                                        Text(
                                                                            'Booking ID ',
                                                                            style:
                                                                                TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                                                                        Text(
                                                                            '2023/05/XD/SD#01',
                                                                            style:
                                                                                TextStyle(color: Colors.blue, fontWeight: FontWeight.w600)),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            spc.hghtRat(0.02)),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                            Navigator.of(context).push(MaterialPageRoute(
                                                                              builder: (context) {
                                                                                return const MyOrder();
                                                                              },
                                                                            ));
                                                                          },
                                                                          child: Container(
                                                                              width: spc.wdRat(0.6),
                                                                              decoration: BoxDecoration(color: const Color.fromARGB(255, 6, 81, 143), borderRadius: BorderRadius.circular(6)),
                                                                              alignment: Alignment.center,
                                                                              child: const Padding(
                                                                                padding: EdgeInsets.symmetric(vertical: 8),
                                                                                child: Text('BACK TO MY ORDER', style: TextStyle(color: Colors.white)),
                                                                              )),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ]),
                                                            ));
                                                          },
                                                        );
                                                        setState(() {
                                                          isFinished = false;
                                                        });
                                                      },
                                                      child: Container(
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
                                                          'Pay',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ));
                                  },
                                );
                              },
                            );
                          }
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
