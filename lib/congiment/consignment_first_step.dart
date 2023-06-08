import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

import '../core/utils.dart';
import 'bloc/congiment_page_change_cubit.dart';
import 'congiment_after_package_selection.dart';
import 'consignment_second_step.dart';

class ConsignmentFirstStep extends StatefulWidget {
  const ConsignmentFirstStep({super.key});

  @override
  State<ConsignmentFirstStep> createState() => _ConsignmentFirstStepState();
}

class _ConsignmentFirstStepState extends State<ConsignmentFirstStep> {
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
  bool switchDestinationValue = true;
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
                  const Text(
                    'Type of Shipment',
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
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 114, 111, 111)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 10, right: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                items: [
                                  ...['Documents']
                                      .map((e) => DropdownMenuItem(
                                              child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 93, 158)),
                                          )))
                                      .toList()
                                ],
                                onChanged: (val) {}),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          'Stock account',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),

                  // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  //   const Text(
                  //     'From Origin',
                  //     style: TextStyle(
                  //         color: Color.fromARGB(255, 121, 117, 117),
                  //         fontWeight: FontWeight.w600),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.only(bottom: 20),
                  //     child: GestureDetector(
                  //       onTap: () {
                  //         showModalBottomSheet(
                  //           context: context,
                  //           isScrollControlled: true,
                  //           backgroundColor: Colors.transparent,
                  //           builder: (context) {
                  //             return GestureDetector(
                  //               onTap: () {
                  //                 addressNode.unfocus();
                  //                 areaNode.unfocus();
                  //                 landmarkNode.unfocus();
                  //                 cityNode.unfocus();
                  //                 zipcodeNode.unfocus();
                  //                 countryNode.unfocus();
                  //               },
                  //               child: Container(
                  //                   height: spc.hghtRat(0.7),
                  //                   decoration: const BoxDecoration(
                  //                       color: Colors.white,
                  //                       borderRadius: BorderRadius.vertical(
                  //                           top: Radius.circular(20))),
                  //                   child: Padding(
                  //                     padding: EdgeInsets.all(spc.wdRat(0.05)),
                  //                     child: ListView(children: [
                  //                       Row(
                  //                         children: const [
                  //                           Text(
                  //                             'Pick any One',
                  //                             style: TextStyle(
                  //                                 fontSize: 18,
                  //                                 fontWeight: FontWeight.w600,
                  //                                 color: appColor),
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       SizedBox(
                  //                         height: spc.hghtRat(0.025),
                  //                       ),
                  //                       for (var i = 0; i < 2; i++)
                  //                         Padding(
                  //                           padding: EdgeInsets.symmetric(
                  //                             vertical: gapBetweenInputFields,
                  //                           ),
                  //                           child: Container(
                  //                             decoration: BoxDecoration(
                  //                                 color: const Color.fromARGB(
                  //                                     255, 197, 223, 245),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(10)),
                  //                             child: Padding(
                  //                               padding: const EdgeInsets.all(8.0),
                  //                               child: Row(
                  //                                   crossAxisAlignment:
                  //                                       CrossAxisAlignment.start,
                  //                                   children: [
                  //                                     const SizedBox(width: 15),
                  //                                     Column(
                  //                                         crossAxisAlignment:
                  //                                             CrossAxisAlignment
                  //                                                 .start,
                  //                                         children: const [
                  //                                           SizedBox(height: 8),
                  //                                           Text(
                  //                                             'Tony Pattichai',
                  //                                             style: TextStyle(
                  //                                                 color:
                  //                                                     Colors.black,
                  //                                                 fontSize: 16,
                  //                                                 fontWeight:
                  //                                                     FontWeight
                  //                                                         .w600),
                  //                                           ),
                  //                                           SizedBox(height: 4),
                  //                                           Text(
                  //                                             'Los Angeles, California, USA',
                  //                                             style: TextStyle(
                  //                                                 color:
                  //                                                     Colors.black,
                  //                                                 fontSize: 12,
                  //                                                 fontWeight:
                  //                                                     FontWeight
                  //                                                         .w500),
                  //                                           ),
                  //                                           SizedBox(height: 8),
                  //                                         ]),
                  //                                     SizedBox(
                  //                                       width: spc.wdRat(0.14),
                  //                                     ),
                  //                                     const Padding(
                  //                                       padding: EdgeInsets.only(
                  //                                           bottom: 10),
                  //                                       child: Icon(
                  //                                         Icons.edit,
                  //                                         size: 12,
                  //                                       ),
                  //                                     ),
                  //                                     const SizedBox(width: 10),
                  //                                     Padding(
                  //                                       padding: EdgeInsets.only(
                  //                                           top: spc.hghtRat(0.04)),
                  //                                       child: const CircleAvatar(
                  //                                           radius: 12,
                  //                                           backgroundColor:
                  //                                               Colors.blue,
                  //                                           child: Icon(
                  //                                             Icons.check,
                  //                                             size: 12,
                  //                                           )),
                  //                                     )
                  //                                   ]),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       Align(
                  //                         child: Container(
                  //                           width: spc.wdRat(0.6),
                  //                           height: spc.hghtRat(0.06),
                  //                           decoration: BoxDecoration(
                  //                               color: const Color.fromARGB(
                  //                                   255, 3, 93, 158),
                  //                               borderRadius:
                  //                                   BorderRadius.circular(10)),
                  //                           alignment: Alignment.center,
                  //                           child: const Text(
                  //                             'SUBMIT',
                  //                             style: TextStyle(color: Colors.white),
                  //                           ),
                  //                         ),
                  //                       )
                  //                     ]),
                  //                   )),
                  //             );
                  //           },
                  //         );
                  //       },
                  //       child: const Text(
                  //         'Pick Your Address',
                  //         style: TextStyle(
                  //             decoration: TextDecoration.underline,
                  //             fontWeight: FontWeight.w600,
                  //             color: Color.fromARGB(255, 3, 93, 158)),
                  //       ),
                  //     ),
                  //   )
                  // ]),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       color: const Color.fromARGB(255, 238, 236, 236),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Padding(
                  //     padding:
                  //         const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: const [
                  //                 SizedBox(height: 10),
                  //                 Text(
                  //                   'Tony Pattichai',
                  //                   style: TextStyle(
                  //                       color: Colors.black,
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //                 SizedBox(height: 4),
                  //                 Text(
                  //                   'Los Angeles, California, USA',
                  //                   style: TextStyle(
                  //                       color: Colors.black,
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //                 SizedBox(height: 10),
                  //               ]),
                  //           const SizedBox(
                  //             width: 10,
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.only(bottom: 10),
                  //             child: Icon(
                  //               Icons.edit,
                  //               size: 18,
                  //             ),
                  //           )
                  //         ]),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: const Color.fromARGB(255, 177, 172, 172)),
              // borderRadius: BorderRadius.circular(10),
              // boxShadow: boxShadow,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spc.wdRat(0.04),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Package Delivery Mode',
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
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 114, 111, 111)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 10, right: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                items: [
                                  ...['Standard']
                                      .map((e) => DropdownMenuItem(
                                              child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 93, 158)),
                                          )))
                                      .toList()
                                ],
                                onChanged: (val) {}),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          'Delivery Mode',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Select Box/Cover Size',
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           color: Color.fromARGB(255, 3, 93, 158),
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //     Row(
                  //       children: [
                  //         const Text(
                  //           'Split',
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               color: Color.fromARGB(255, 3, 93, 158),
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //         Transform.scale(
                  //           scale: 0.7,
                  //           child: Switch(
                  //             value: switchSelectBoxSplitValue,
                  //             activeColor: const Color(0xFF6200EE),
                  //             onChanged: (bool value) {
                  //               setState(() {
                  //                 switchSelectBoxSplitValue = value;
                  //               });
                  //             },
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Stack(
                  //   children: [
                  //     Container(
                  //       width: spc.wdRat(1),
                  //       height: 60,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.black),
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding:
                  //             const EdgeInsets.only(top: 18, left: 10, right: 10),
                  //         child: DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //               isExpanded: true,
                  //               icon: GestureDetector(
                  //                 onTap: () {
                  //                   showModalBottomSheet(
                  //                     context: context,
                  //                     isScrollControlled: true,
                  //                     backgroundColor: Colors.transparent,
                  //                     builder: (context) {
                  //                       return GestureDetector(
                  //                         onTap: () {
                  //                           addressNode.unfocus();
                  //                           areaNode.unfocus();
                  //                           landmarkNode.unfocus();
                  //                           cityNode.unfocus();
                  //                           zipcodeNode.unfocus();
                  //                           countryNode.unfocus();
                  //                         },
                  //                         child: Container(
                  //                             height: spc.hghtRat(0.7),
                  //                             decoration: const BoxDecoration(
                  //                                 color: Colors.white,
                  //                                 borderRadius:
                  //                                     BorderRadius.vertical(
                  //                                         top:
                  //                                             Radius.circular(20))),
                  //                             child: Padding(
                  //                               padding:
                  //                                   EdgeInsets.all(spc.wdRat(0.05)),
                  //                               child: ListView(children: [
                  //                                 Row(
                  //                                   children: const [
                  //                                     Text(
                  //                                       'Split Boxes',
                  //                                       style: TextStyle(
                  //                                           fontSize: 18,
                  //                                           fontWeight:
                  //                                               FontWeight.w600,
                  //                                           color: appColor),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 SizedBox(
                  //                                   height: spc.hghtRat(0.025),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsets.symmetric(
                  //                                     vertical:
                  //                                         gapBetweenInputFields,
                  //                                   ),
                  //                                   child: Container(
                  //                                     decoration: BoxDecoration(
                  //                                         color:
                  //                                             const Color.fromARGB(
                  //                                                 255,
                  //                                                 197,
                  //                                                 223,
                  //                                                 245),
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 10)),
                  //                                     child: Padding(
                  //                                       padding:
                  //                                           const EdgeInsets.all(
                  //                                               8.0),
                  //                                       child: Row(
                  //                                           crossAxisAlignment:
                  //                                               CrossAxisAlignment
                  //                                                   .start,
                  //                                           mainAxisAlignment:
                  //                                               MainAxisAlignment
                  //                                                   .spaceBetween,
                  //                                           children: [
                  //                                             Image.asset(
                  //                                                 'assets/images/box.png',
                  //                                                 height: 80),
                  //                                             Column(
                  //                                               crossAxisAlignment:
                  //                                                   CrossAxisAlignment
                  //                                                       .end,
                  //                                               children: [
                  //                                                 const SizedBox(
                  //                                                     height: 10),
                  //                                                 const Padding(
                  //                                                   padding: EdgeInsets
                  //                                                       .only(
                  //                                                           bottom:
                  //                                                               10),
                  //                                                   child: Text(
                  //                                                       'Max Load 35 kg',
                  //                                                       style: TextStyle(
                  //                                                           fontSize:
                  //                                                               12)),
                  //                                                 ),
                  //                                                 Padding(
                  //                                                   padding: EdgeInsets.only(
                  //                                                       top: spc
                  //                                                           .hghtRat(
                  //                                                               0.04)),
                  //                                                   child:
                  //                                                       const CircleAvatar(
                  //                                                           radius:
                  //                                                               12,
                  //                                                           backgroundColor:
                  //                                                               Colors
                  //                                                                   .blue,
                  //                                                           child:
                  //                                                               Icon(
                  //                                                             Icons
                  //                                                                 .check,
                  //                                                             size:
                  //                                                                 12,
                  //                                                           )),
                  //                                                 ),
                  //                                                 const SizedBox(
                  //                                                     height: 10),
                  //                                               ],
                  //                                             ),
                  //                                           ]),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Align(
                  //                                   child: Container(
                  //                                     width: spc.wdRat(0.6),
                  //                                     height: spc.hghtRat(0.06),
                  //                                     decoration: BoxDecoration(
                  //                                         color:
                  //                                             const Color.fromARGB(
                  //                                                 255, 3, 93, 158),
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 10)),
                  //                                     alignment: Alignment.center,
                  //                                     child: const Text(
                  //                                       'SUBMIT',
                  //                                       style: TextStyle(
                  //                                           color: Colors.white),
                  //                                     ),
                  //                                   ),
                  //                                 )
                  //                               ]),
                  //                             )),
                  //                       );
                  //                     },
                  //                   );
                  //                 },
                  //                 child: const Icon(Icons.arrow_drop_down,
                  //                     color: Colors.black),
                  //               ),
                  //               items: [
                  //                 ...['Box 12x23']
                  //                     .map((e) => DropdownMenuItem(
                  //                             child: Text(
                  //                           e,
                  //                           style: const TextStyle(
                  //                               color: Color.fromARGB(
                  //                                   255, 3, 93, 158)),
                  //                         )))
                  //                     .toList()
                  //               ],
                  //               onChanged: (val) {}),
                  //         ),
                  //       ),
                  //     ),
                  //     const Padding(
                  //       padding: EdgeInsets.only(top: 5, left: 10),
                  //       child: Text(
                  //         'Stock account',
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(color: const Color.fromARGB(255, 177, 172, 172)),
              // borderRadius: BorderRadius.circular(10),
              // boxShadow: boxShadow,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spc.wdRat(0.04),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Destination Country',
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
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 114, 111, 111)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 18, left: 10, right: 10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                items: [
                                  ...['United States']
                                      .map((e) => DropdownMenuItem(
                                              child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 3, 93, 158)),
                                          )))
                                      .toList()
                                ],
                                onChanged: (val) {}),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          'Destination Country',
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Select Box/Cover Size',
                  //       style: TextStyle(
                  //           fontSize: 18,
                  //           color: Color.fromARGB(255, 3, 93, 158),
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //     Row(
                  //       children: [
                  //         const Text(
                  //           'Split',
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               color: Color.fromARGB(255, 3, 93, 158),
                  //               fontWeight: FontWeight.w500),
                  //         ),
                  //         Transform.scale(
                  //           scale: 0.7,
                  //           child: Switch(
                  //             value: switchSelectBoxSplitValue,
                  //             activeColor: const Color(0xFF6200EE),
                  //             onChanged: (bool value) {
                  //               setState(() {
                  //                 switchSelectBoxSplitValue = value;
                  //               });
                  //             },
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // Stack(
                  //   children: [
                  //     Container(
                  //       width: spc.wdRat(1),
                  //       height: 60,
                  //       decoration: BoxDecoration(
                  //           border: Border.all(color: Colors.black),
                  //           borderRadius: BorderRadius.circular(10)),
                  //       child: Padding(
                  //         padding:
                  //             const EdgeInsets.only(top: 18, left: 10, right: 10),
                  //         child: DropdownButtonHideUnderline(
                  //           child: DropdownButton(
                  //               isExpanded: true,
                  //               icon: GestureDetector(
                  //                 onTap: () {
                  //                   showModalBottomSheet(
                  //                     context: context,
                  //                     isScrollControlled: true,
                  //                     backgroundColor: Colors.transparent,
                  //                     builder: (context) {
                  //                       return GestureDetector(
                  //                         onTap: () {
                  //                           addressNode.unfocus();
                  //                           areaNode.unfocus();
                  //                           landmarkNode.unfocus();
                  //                           cityNode.unfocus();
                  //                           zipcodeNode.unfocus();
                  //                           countryNode.unfocus();
                  //                         },
                  //                         child: Container(
                  //                             height: spc.hghtRat(0.7),
                  //                             decoration: const BoxDecoration(
                  //                                 color: Colors.white,
                  //                                 borderRadius:
                  //                                     BorderRadius.vertical(
                  //                                         top:
                  //                                             Radius.circular(20))),
                  //                             child: Padding(
                  //                               padding:
                  //                                   EdgeInsets.all(spc.wdRat(0.05)),
                  //                               child: ListView(children: [
                  //                                 Row(
                  //                                   children: const [
                  //                                     Text(
                  //                                       'Split Boxes',
                  //                                       style: TextStyle(
                  //                                           fontSize: 18,
                  //                                           fontWeight:
                  //                                               FontWeight.w600,
                  //                                           color: appColor),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                                 SizedBox(
                  //                                   height: spc.hghtRat(0.025),
                  //                                 ),
                  //                                 Padding(
                  //                                   padding: EdgeInsets.symmetric(
                  //                                     vertical:
                  //                                         gapBetweenInputFields,
                  //                                   ),
                  //                                   child: Container(
                  //                                     decoration: BoxDecoration(
                  //                                         color:
                  //                                             const Color.fromARGB(
                  //                                                 255,
                  //                                                 197,
                  //                                                 223,
                  //                                                 245),
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 10)),
                  //                                     child: Padding(
                  //                                       padding:
                  //                                           const EdgeInsets.all(
                  //                                               8.0),
                  //                                       child: Row(
                  //                                           crossAxisAlignment:
                  //                                               CrossAxisAlignment
                  //                                                   .start,
                  //                                           mainAxisAlignment:
                  //                                               MainAxisAlignment
                  //                                                   .spaceBetween,
                  //                                           children: [
                  //                                             Image.asset(
                  //                                                 'assets/images/box.png',
                  //                                                 height: 80),
                  //                                             Column(
                  //                                               crossAxisAlignment:
                  //                                                   CrossAxisAlignment
                  //                                                       .end,
                  //                                               children: [
                  //                                                 const SizedBox(
                  //                                                     height: 10),
                  //                                                 const Padding(
                  //                                                   padding: EdgeInsets
                  //                                                       .only(
                  //                                                           bottom:
                  //                                                               10),
                  //                                                   child: Text(
                  //                                                       'Max Load 35 kg',
                  //                                                       style: TextStyle(
                  //                                                           fontSize:
                  //                                                               12)),
                  //                                                 ),
                  //                                                 Padding(
                  //                                                   padding: EdgeInsets.only(
                  //                                                       top: spc
                  //                                                           .hghtRat(
                  //                                                               0.04)),
                  //                                                   child:
                  //                                                       const CircleAvatar(
                  //                                                           radius:
                  //                                                               12,
                  //                                                           backgroundColor:
                  //                                                               Colors
                  //                                                                   .blue,
                  //                                                           child:
                  //                                                               Icon(
                  //                                                             Icons
                  //                                                                 .check,
                  //                                                             size:
                  //                                                                 12,
                  //                                                           )),
                  //                                                 ),
                  //                                                 const SizedBox(
                  //                                                     height: 10),
                  //                                               ],
                  //                                             ),
                  //                                           ]),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                                 Align(
                  //                                   child: Container(
                  //                                     width: spc.wdRat(0.6),
                  //                                     height: spc.hghtRat(0.06),
                  //                                     decoration: BoxDecoration(
                  //                                         color:
                  //                                             const Color.fromARGB(
                  //                                                 255, 3, 93, 158),
                  //                                         borderRadius:
                  //                                             BorderRadius.circular(
                  //                                                 10)),
                  //                                     alignment: Alignment.center,
                  //                                     child: const Text(
                  //                                       'SUBMIT',
                  //                                       style: TextStyle(
                  //                                           color: Colors.white),
                  //                                     ),
                  //                                   ),
                  //                                 )
                  //                               ]),
                  //                             )),
                  //                       );
                  //                     },
                  //                   );
                  //                 },
                  //                 child: const Icon(Icons.arrow_drop_down,
                  //                     color: Colors.black),
                  //               ),
                  //               items: [
                  //                 ...['Box 12x23']
                  //                     .map((e) => DropdownMenuItem(
                  //                             child: Text(
                  //                           e,
                  //                           style: const TextStyle(
                  //                               color: Color.fromARGB(
                  //                                   255, 3, 93, 158)),
                  //                         )))
                  //                     .toList()
                  //               ],
                  //               onChanged: (val) {}),
                  //         ),
                  //       ),
                  //     ),
                  //     const Padding(
                  //       padding: EdgeInsets.only(top: 5, left: 10),
                  //       child: Text(
                  //         'Stock account',
                  //         style: TextStyle(fontSize: 12),
                  //       ),
                  //     )
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //   color: Colors.blue,
                // ),
                // borderRadius: BorderRadius.circular(10),
                // boxShadow: boxShadow,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Load Bag In',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 3, 93, 158)),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color.fromARGB(255, 114, 111, 111),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: boxShadow,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                  width: spc.wdRat(0.2),
                                  child: const Text(
                                    'Is Slab',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Transform.scale(
                                scale: 0.8,
                                child: Switch(
                                  value: switchSlabValue,
                                  activeColor: const Color(0xFF6200EE),
                                  onChanged: (bool value) {
                                    setState(() {
                                      switchSlabValue = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    sliderValue.toString().contains('.')
                                        ? sliderValue.toString().substring(0,
                                            sliderValue.toString().indexOf('.'))
                                        : '${sliderValue.toString()}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              Container(
                                width: spc.wdRat(0.77),
                                alignment: Alignment.centerLeft,
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    overlayShape: SliderComponentShape.noThumb,
                                  ),
                                  child: Slider(
                                    value: sliderValue,
                                    max: 600,
                                    divisions: switchSlabValue ? 120 : 600,
                                    label: sliderValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        sliderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ]),
      ],
    );
  }
}
