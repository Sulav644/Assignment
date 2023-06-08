import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:xoomship/congiment/congiment_view.dart';
import 'package:xoomship/core/utils.dart';

import '../dash_board/dash_board.dart';

class ConsignmentAfterPackageSelection extends StatefulWidget {
  const ConsignmentAfterPackageSelection({super.key});

  @override
  State<ConsignmentAfterPackageSelection> createState() =>
      _ConsignmentAfterPackageSelectionState();
}

class _ConsignmentAfterPackageSelectionState
    extends State<ConsignmentAfterPackageSelection> {
  bool checked = false;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    final cmp = Components();
    final spc = Space(context: context);
    const appColor = Color.fromARGB(255, 3, 93, 158);
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
                              Text('Check and confirm your detail',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Stack(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: appColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text(
                                              '550',
                                              style: TextStyle(
                                                  fontSize: 55,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: 3),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '/',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(width: 3),
                                                  Text(
                                                    'Kg',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(width: 3),
                                                  Text(
                                                    '+',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(width: 3),
                                                  Text(
                                                    'GST',
                                                    style: TextStyle(
                                                        fontSize: 28,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          Text(
                                            'Standard Shipping',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          )
                                        ]),
                                        Row(
                                          children: [
                                            Text(
                                              '65',
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(width: 3),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    '/',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  SizedBox(width: 3),
                                                  Text(
                                                    'Kg',
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      'assets/images/check_icon.svg',
                                      height: 40,
                                      colorFilter: ColorFilter.mode(
                                          Colors.white, BlendMode.srcIn),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: spc.wdRat(1),
                                height: spc.hghtRat(0.24),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                          'assets/images/box_checked.png',
                                          height: spc.hghtRat(0.15),
                                          fit: BoxFit.cover),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: spc.hghtRat(0.025)),
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
                          SizedBox(height: spc.hghtRat(0.04)),
                          Row(children: [
                            Checkbox(
                              value: checked,
                              fillColor: MaterialStateProperty.all(appColor),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'The customer is responsible for custom/'),
                                  Text('duties/charges and will not be hold'),
                                  Text(
                                      'xoomship against any of the associated'),
                                  Text('charges and/or delays arising due to'),
                                  Text('customs clearance.'),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(height: 60),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
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
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 50);
    path.quadraticBezierTo(0, 20, size.width - 80, 24);
    path.quadraticBezierTo(size.width, 30, size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
