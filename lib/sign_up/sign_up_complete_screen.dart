import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:xoomship/core/utils.dart';

import '../congiment/signin_page.dart';
import '../dash_board/dash_board.dart';

class SignUpCompleteScreen extends StatefulWidget {
  const SignUpCompleteScreen({super.key});

  @override
  State<SignUpCompleteScreen> createState() => _SignUpCompleteScreenState();
}

class _SignUpCompleteScreenState extends State<SignUpCompleteScreen> {
  @override
  void initState() {
    super.initState();
    // playVideo(init: true);
    // Future.delayed(
    //     Duration(seconds: 2),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           builder: (context) {
    //             return DashBoard();
    //           },
    //         )));
  }

  @override
  Widget build(BuildContext context) {
    final cmp = Components();
    final spc = Space(context: context);
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10));
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Colors.black,
      ),
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) {
            return DashBoard();
          },
        ));
      },
      child: Scaffold(
        appBar: cmp.appBar,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: spc.wdRat(0.05), vertical: spc.hghtRat(0.008)),
          child: Column(children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 128, 124, 124),
                              offset: Offset(1, 1)),
                          BoxShadow(
                              color: Color.fromARGB(255, 128, 124, 124),
                              offset: Offset(-1, 1))
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_back,
                        size: 18,
                      ),
                    )),
                SizedBox(
                  width: 12,
                ),
                Text(
                  '2-Step Verification',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: spc.hghtRat(0.07),
            ),
            Text(
              'Congratulations!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: spc.hghtRat(0.015)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    radius: 14,
                    backgroundColor: Color.fromARGB(255, 13, 97, 165),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 18,
                    )),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Verified October 07-2021 05:30',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: spc.hghtRat(0.04),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 13, 97, 165),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: spc.wdRat(0.16), vertical: spc.hghtRat(0.02)),
                  child: Column(children: [
                    SizedBox(height: 10),
                    Text(
                      'Text Message',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: spc.hghtRat(0.016)),
                    SizedBox(
                        width: spc.wdRat(0.7),
                        child: Text(
                          'Use your mobile number to receive security code',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 1.6),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(height: spc.hghtRat(0.016)),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: spc.wdRat(0.1),
                            vertical: spc.hghtRat(0.02)),
                        child: Text(
                          'Turn Off Verification',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ]),
                )),
            SizedBox(height: spc.hghtRat(0.025)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '+1 XXXX YY65',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: spc.hghtRat(0.01)),
            Text(
              'Add more second steps to verify that its you',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ),
      ),
    );
  }
}
