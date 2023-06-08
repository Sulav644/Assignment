import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:xoomship/congiment/price_level.dart';

import '../core/utils.dart';
import '../dash_board/components/tabbar/tabbar_item.dart';
import '../dash_board/dash_board.dart';

class RateCalculator extends StatefulWidget {
  const RateCalculator({super.key});

  @override
  State<RateCalculator> createState() => _RateCalculatorState();
}

class _RateCalculatorState extends State<RateCalculator>
    with TickerProviderStateMixin {
  late TabController tabController;
  int index = 0;

  bool checked = false;

  bool isFinished = false;
  double sliderValue = 0.0;
  bool switchSlabValue = true;
  bool switchSelectBoxSplitValue = true;
  bool switchDestinationValue = true;
  bool switchSelfDropValue = true;
  bool switchSelfDropOffValue = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final cmp = Components();
    final spc = Space(context: context);
    const appColor = Color.fromARGB(255, 3, 93, 158);
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));

    final gapBetweenInputFields = spc.hghtRat(0.02);

    final boxShadow = [
      const BoxShadow(
          color: Color.fromARGB(255, 151, 147, 147),
          offset: Offset(0, 0),
          blurRadius: 10)
    ];
    final boxGap = spc.hghtRat(0.03);
    return Scaffold(
        appBar: cmp.appBar,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(children: [
                Image.asset('assets/images/xoom_banner.gif',
                    width: spc.wdRat(1),
                    height: spc.hghtRat(0.28),
                    fit: BoxFit.cover),
                Column(
                  children: [
                    SizedBox(height: spc.hghtRat(0.27)),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 100, 100, 100),
                                offset: Offset(0, -2),
                                blurRadius: 8)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(spc.wdRat(0.04)),
                        child: Column(
                          children: [
                            SizedBox(height: spc.hghtRat(0.01)),
                            Row(
                              children: [
                                Text('Destination Country',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Stack(
                              children: [
                                Container(
                                  width: spc.wdRat(1),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 102, 99, 99)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18, left: 10, right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          isExpanded: true,
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
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
                            SizedBox(height: spc.hghtRat(0.04)),
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
                                  SizedBox(height: spc.hghtRat(0.04)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                sliderValue
                                                        .toString()
                                                        .contains('.')
                                                    ? '${sliderValue.toString().substring(0, sliderValue.toString().indexOf('.'))}'
                                                    : '${sliderValue.toString()}',
                                                style: const TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 4),
                                                child: Text(
                                                  ' Kg',
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
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
                                            overlayShape:
                                                SliderComponentShape.noThumb,
                                          ),
                                          child: Slider(
                                            value: sliderValue,
                                            max: 600,
                                            divisions:
                                                switchSlabValue ? 120 : 600,
                                            label:
                                                sliderValue.round().toString(),
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
                            SizedBox(height: 30),
                            Row(
                              children: [
                                const Text(
                                  'Type of Shipment',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 3, 93, 158),
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Stack(
                              children: [
                                Container(
                                  width: spc.wdRat(1),
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromARGB(255, 102, 99, 99)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 18, left: 10, right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          isExpanded: true,
                                          icon: const Icon(
                                              Icons.arrow_drop_down,
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
                                    'Shipment Type',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: spc.hghtRat(0.06)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                child: Row(
                                  children: [
                                    TabBar(
                                        labelPadding: EdgeInsets.zero,
                                        indicator: BoxDecoration(),
                                        indicatorColor: Colors.transparent,
                                        dividerColor: Colors.transparent,
                                        isScrollable: true,
                                        controller: tabController,
                                        onTap: (value) => setState(() {
                                              index = value;
                                            }),
                                        tabs: [
                                          TabBarItem(
                                            labelIndex: 0,
                                            indIndex: index,
                                            title: 'Standard',
                                          ),
                                          TabBarItem(
                                            labelIndex: 1,
                                            indIndex: index,
                                            title: 'Economy',
                                          ),
                                          TabBarItem(
                                            labelIndex: 2,
                                            indIndex: index,
                                            title: 'Express',
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                  width: spc.wdRat(1),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 173, 209, 238),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: spc.wdRat(0.02)),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: spc.hghtRat(0.02),
                                          ),
                                          PriceLevel(
                                              boxColor: Color.fromARGB(
                                                  255, 3, 93, 158),
                                              textColor: Colors.white,
                                              title: 'Total Gross Amount',
                                              price: '65'),
                                          PriceLevel(
                                              boxColor: Color.fromARGB(
                                                  255, 3, 93, 158),
                                              textColor: Colors.white,
                                              title: 'Total tax GST 18%',
                                              price: '965.00'),
                                          PriceLevel(
                                              boxColor: Color.fromARGB(
                                                  255, 3, 93, 158),
                                              textColor: Colors.white,
                                              title: 'Total Charges',
                                              price: '62,725.00'),
                                          SizedBox(
                                            height: spc.hghtRat(0.05),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  width: spc.wdRat(0.8),
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 3, 93, 158),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: spc
                                                                .hghtRat(0.03)),
                                                    child: Text('75,145.5',
                                                        style: TextStyle(
                                                            fontSize: 28,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                Colors.white)),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                            height: spc.hghtRat(0.05),
                                          ),
                                        ]),
                                  )),
                            ),
                            SizedBox(
                              height: spc.hghtRat(0.05),
                            ),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: checked,
                                    fillColor:
                                        MaterialStateProperty.all(appColor),
                                    onChanged: (value) {
                                      setState(() {
                                        checked = value!;
                                      });
                                    },
                                  ),
                                  DefaultTextStyle(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'The customer is responsible for custom/'),
                                        Text(
                                            'duties/charges and will not be hold'),
                                        Text(
                                            'xoomship against any of the associated'),
                                        Text(
                                            'charges and/or delays arising due to'),
                                        Text('customs clearance.'),
                                      ],
                                    ),
                                  ),
                                ]),
                            SizedBox(
                              height: spc.hghtRat(0.2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return DashBoard();
                            },
                          ));
                        },
                        child: Icon(Icons.arrow_back)),
                    Icon(Icons.more_vert)
                  ],
                ),
              ]),
            ),
            Container(
              height: spc.hghtRat(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: spc.hghtRat(0.02)),
                    child: Transform.scale(
                      scale: 0.9,
                      child: SwipeableButtonView(
                          buttonText: 'Swipe and Continue',
                          buttontextstyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                          buttonWidget: Container(
                            child: Transform.rotate(
                                angle: 90 / 180 * pi,
                                child: Icon(Icons.flight, color: appColor)),
                          ),
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
                          }),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
