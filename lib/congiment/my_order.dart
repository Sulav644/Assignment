import 'dart:math';

import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:xoomship/core/utils.dart';

import 'booking_page.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final appColor = Color.fromARGB(255, 3, 93, 158);
    return Scaffold(
        backgroundColor: Colors.white,
        // This is handled by the search bar itself.
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('My Order'),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
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
                        centerTitle: 'Flight, Hotel, Train and more',
                        centerTitleStyle: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 114, 109, 109)),
                        onChanged: (text) => debugPrint(text),
                        searchTextEditingController: controller,
                        horizontalPadding: 5),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.06)),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 221, 231, 238),
                        child: CalendarTimeline(
                          initialDate: DateTime(2020, 4, 20),
                          firstDate: DateTime(2019, 1, 15),
                          lastDate: DateTime(2020, 11, 20),
                          onDateSelected: (date) => print(date),
                          leftMargin: 20,
                          monthColor: Colors.blueGrey,
                          dayColor: Color.fromARGB(255, 1, 18, 32),
                          activeDayColor: Color.fromARGB(255, 3, 93, 158),
                          activeBackgroundDayColor: Colors.white,
                          dotsColor: Color(0xFF333A47),
                          selectableDayPredicate: (date) => date.day != 23,
                          locale: 'en_ISO',
                        ),
                      ),
                      SizedBox(height: spc.hghtRat(0.03)),
                      Row(
                        children: [
                          Text('October',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 70, 67, 67),
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      SizedBox(height: spc.hghtRat(0.02)),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.8,
                                color: Color.fromARGB(255, 107, 103, 103)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    CircleAvatar(
                                      backgroundColor: appColor,
                                      radius: 14,
                                      child: Transform.rotate(
                                          angle: 90 / 180 * pi,
                                          child: Icon(Icons.flight,
                                              size: 16, color: Colors.white)),
                                    ),
                                    SizedBox(width: spc.wdRat(0.05)),
                                    Text('Citilink Indonesia'),
                                  ]),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              SizedBox(height: 15),
                              Row(children: [
                                Container(
                                    width: spc.wdRat(0.4),
                                    child: Text('Destination',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100)))),
                                Text('Jakarta to Singapore',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        fontWeight: FontWeight.w600)),
                              ]),
                              SizedBox(height: 6),
                              Row(children: [
                                Container(
                                    width: spc.wdRat(0.4),
                                    child: Text('Payment',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100)))),
                                GestureDetector(
                                    onTap: () {
                                      // showDialog(
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return AlertDialog(
                                      //       contentPadding: EdgeInsets.zero,
                                      //       content: SingleChildScrollView(
                                      //         child: Column(children: [
                                      //           Container(
                                      //             decoration: BoxDecoration(
                                      //                 color: Color.fromARGB(
                                      //                     255, 222, 233, 243),
                                      //                 borderRadius:
                                      //                     BorderRadius.circular(
                                      //                         8)),
                                      //             child: Padding(
                                      //               padding:
                                      //                   EdgeInsets.symmetric(
                                      //                       horizontal:
                                      //                           spc.wdRat(0.1),
                                      //                       vertical: spc
                                      //                           .hghtRat(0.01)),
                                      //               child: Column(
                                      //                 children: [
                                      //                   Row(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .spaceBetween,
                                      //                       children: [
                                      //                         Text(
                                      //                           'IND',
                                      //                           style: TextStyle(
                                      //                               fontSize:
                                      //                                   24,
                                      //                               fontWeight:
                                      //                                   FontWeight
                                      //                                       .w600),
                                      //                         ),
                                      //                         Transform.rotate(
                                      //                           angle: 90 /
                                      //                               180 *
                                      //                               pi,
                                      //                           child: Image.asset(
                                      //                               'assets/images/car.png',
                                      //                               height: 35),
                                      //                         ),
                                      //                         Text(
                                      //                           'USA',
                                      //                           style: TextStyle(
                                      //                               fontSize:
                                      //                                   24,
                                      //                               fontWeight:
                                      //                                   FontWeight
                                      //                                       .w600),
                                      //                         )
                                      //                       ]),
                                      //                   Row(children: [
                                      //                     Text(
                                      //                       'Booking date:',
                                      //                       style: TextStyle(
                                      //                           fontSize: 14,
                                      //                           color: Color
                                      //                               .fromARGB(
                                      //                                   255,
                                      //                                   150,
                                      //                                   150,
                                      //                                   150),
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600),
                                      //                     ),
                                      //                     SizedBox(width: 5),
                                      //                     Text(
                                      //                       '08-11-2017',
                                      //                       style: TextStyle(
                                      //                           fontSize: 14,
                                      //                           color: Color
                                      //                               .fromARGB(
                                      //                                   255,
                                      //                                   60,
                                      //                                   60,
                                      //                                   60),
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600),
                                      //                     )
                                      //                   ]),
                                      //                 ],
                                      //               ),
                                      //             ),
                                      //           ),
                                      //           SizedBox(height: 10),
                                      //           Container(
                                      //               decoration: BoxDecoration(
                                      //                   color: Colors.white,
                                      //                   border: Border.all(
                                      //                       width: 0.8,
                                      //                       color:
                                      //                           Color.fromARGB(
                                      //                               255,
                                      //                               117,
                                      //                               112,
                                      //                               112)),
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(8)),
                                      //               child: Padding(
                                      //                 padding:
                                      //                     EdgeInsets.symmetric(
                                      //                         horizontal: spc
                                      //                             .wdRat(0.1),
                                      //                         vertical: spc
                                      //                             .hghtRat(
                                      //                                 0.01)),
                                      //                 child: Column(
                                      //                   children: [
                                      //                     Text(
                                      //                         'To Mr.Namakr Goud'),
                                      //                     Text(
                                      //                         '+1 987 3465 987')
                                      //                   ],
                                      //                 ),
                                      //               )),
                                      //           Padding(
                                      //             padding: EdgeInsets.symmetric(
                                      //                 horizontal:
                                      //                     spc.wdRat(0.05)),
                                      //             child: Divider(),
                                      //           ),
                                      //           Padding(
                                      //             padding: EdgeInsets.symmetric(
                                      //                 horizontal:
                                      //                     spc.wdRat(0.08)),
                                      //             child: Row(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .spaceBetween,
                                      //                 children: [
                                      //                   Image.asset(
                                      //                       'assets/images/box.png',
                                      //                       height: spc
                                      //                           .hghtRat(0.12)),
                                      //                   Column(children: [
                                      //                     SizedBox(height: 10),
                                      //                     Text(
                                      //                       '65 Kg',
                                      //                       style: TextStyle(
                                      //                           fontSize: 24,
                                      //                           fontWeight:
                                      //                               FontWeight
                                      //                                   .w600),
                                      //                     ),
                                      //                     SizedBox(height: 10),
                                      //                     Container(
                                      //                         decoration: BoxDecoration(
                                      //                             border: Border.all(
                                      //                                 color: Colors
                                      //                                     .blue),
                                      //                             borderRadius:
                                      //                                 BorderRadius
                                      //                                     .circular(
                                      //                                         10)),
                                      //                         child: Padding(
                                      //                           padding: EdgeInsets.symmetric(
                                      //                               horizontal:
                                      //                                   spc.wdRat(
                                      //                                       0.08),
                                      //                               vertical: spc
                                      //                                   .hghtRat(
                                      //                                       0.01)),
                                      //                           child: Text(
                                      //                             '2 Packs',
                                      //                             style: TextStyle(
                                      //                                 fontSize:
                                      //                                     18,
                                      //                                 fontWeight:
                                      //                                     FontWeight
                                      //                                         .w500),
                                      //                           ),
                                      //                         )),
                                      //                     SizedBox(height: 10),
                                      //                   ])
                                      //                 ]),
                                      //           ),
                                      // QrImageView(
                                      //   data: 'hello',
                                      //   size: 200,
                                      //   backgroundColor: Colors.white,
                                      // ),
                                      //           Container(
                                      //               decoration: BoxDecoration(
                                      //                   border: Border.all(
                                      //                       color: Colors.blue),
                                      //                   borderRadius:
                                      //                       BorderRadius
                                      //                           .circular(10)),
                                      //               child: Padding(
                                      //                 padding:
                                      //                     EdgeInsets.symmetric(
                                      //                         horizontal: spc
                                      //                             .wdRat(0.08),
                                      //                         vertical: spc
                                      //                             .hghtRat(
                                      //                                 0.01)),
                                      //                 child: Text(
                                      //                   '2023/05/XS/SD # 01',
                                      //                   style: TextStyle(
                                      //                       fontSize: 18,
                                      //                       fontWeight:
                                      //                           FontWeight
                                      //                               .w500),
                                      //                 ),
                                      //               )),
                                      //           SizedBox(height: 10),
                                      //         ]),
                                      //       ),
                                      //     );
                                      //   },
                                      // );
                                    },
                                    child: Text('Credit Card',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100),
                                            fontWeight: FontWeight.w600))),
                              ]),
                              SizedBox(height: 6),
                              Row(children: [
                                Container(
                                    width: spc.wdRat(0.4),
                                    child: Text('Travel date',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 100, 100, 100)))),
                                Text('27 December 2019',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 100, 100, 100),
                                        fontWeight: FontWeight.w600)),
                              ]),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) {
                                          return BookingPage(
                                            context: context,
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 165, 208, 243),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: spc.wdRat(0.08),
                                              vertical: 8),
                                          child: Text('Show your booking id',
                                              style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                        )),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(Icons.arrow_forward))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: spc.wdRat(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                        width: spc.wdRat(0.3),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(255, 150, 150, 150),
                                  offset: Offset(0, 4),
                                  blurRadius: 8)
                            ]),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('More'),
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 12,
                                backgroundColor:
                                    Color.fromARGB(255, 207, 202, 202),
                                child: Icon(
                                  Icons.arrow_downward,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
