import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/sign_up/sign_up_complete_screen.dart';

class OtpSendScreen extends StatelessWidget {
  const OtpSendScreen({super.key});

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
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    );
    return Scaffold(
      appBar: cmp.appBar,
      body: SingleChildScrollView(
        child: Padding(
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
                  width: 20,
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
            SizedBox(height: spc.hghtRat(0.04)),
            Image.asset(
              'assets/images/open_mail_paper.png',
              height: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: spc.hghtRat(0.04)),
            SizedBox(
              width: spc.wdRat(0.95),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  ...'A text message with your code has been sent to'
                      .split(' ')
                      .map((e) => Text(
                            "$e ",
                            style: TextStyle(
                              color: Colors.black,
                              height: 1.6,
                              fontSize: 18,
                            ),
                          ))
                      .toList(),
                  Text(
                    '+1 XXXX YYY65',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: spc.hghtRat(0.07),
            ),
            Text(
              'Enter a 5 Digit Code',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.02),
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              length: 5,
              obscureText: true,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
            SizedBox(
              height: spc.hghtRat(0.02),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.visibility_off), Text('View Code')]),
            SizedBox(
              height: spc.hghtRat(0.04),
            ),
            Text(
              'Resend Verification Code',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline),
            ),
            SizedBox(
              height: spc.hghtRat(0.12),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Step1'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SignUpCompleteScreen();
                    },
                  ));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 97, 165),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: spc.wdRat(0.16),
                          vertical: spc.hghtRat(0.02)),
                      child: Text('Next'),
                    )),
              )
            ])
          ]),
        ),
      ),
    );
  }
}
