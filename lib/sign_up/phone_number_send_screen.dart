import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/sign_up/otp_send_screen.dart';

class PhoneNumberSendScreen extends StatelessWidget {
  const PhoneNumberSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cmp = Components();
    final spc = Space(context: context);
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 107, 105, 105)),
        borderRadius: BorderRadius.circular(10));
    return Scaffold(
      appBar: cmp.appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: spc.wdRat(0.05), vertical: spc.hghtRat(0.008)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          SizedBox(height: spc.hghtRat(0.03)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's set up your phone",
                style: TextStyle(
                    color: Color.fromARGB(255, 13, 97, 165),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: spc.hghtRat(0.03),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 177, 172, 172)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: spc.wdRat(0.04), vertical: spc.hghtRat(0.028)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mobile Number',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  IntlPhoneField(
                    disableLengthCheck: true,
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        fillColor: Color.fromARGB(255, 238, 236, 236),
                        filled: true,
                        border: border,
                        focusedBorder: border,
                        enabledBorder: border),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: spc.hghtRat(0.07),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select any one option to get code',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: spc.hghtRat(0.025),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 13, 97, 165),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: spc.wdRat(0.04),
                        ),
                        Image.asset('assets/images/open_mail_paper.png'),
                        SizedBox(
                          width: spc.wdRat(0.04),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Text Message',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Receive code via message',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ],
                    ),
                    SizedBox(
                      width: spc.wdRat(0.04),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                            width: spc.wdRat(0.09),
                            height: spc.hghtRat(0.1),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 141, 134),
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ])),
          SizedBox(
            height: spc.hghtRat(0.022),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 211, 204, 204),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: spc.wdRat(0.04),
                        ),
                        Image.asset('assets/images/phone_call.png'),
                        SizedBox(
                          width: spc.wdRat(0.04),
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Text Message',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Receive code via phone',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              )
                            ]),
                      ],
                    ),
                    SizedBox(
                      width: spc.wdRat(0.04),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                          width: spc.wdRat(0.09),
                          height: spc.hghtRat(0.1),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.check,
                            color: Colors.transparent,
                          )),
                    ),
                  ])),
          SizedBox(height: spc.hghtRat(0.12)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Step1'),
            GestureDetector(
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 13, 97, 165),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: spc.wdRat(0.16),
                        vertical: spc.hghtRat(0.02)),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
            )
          ])
        ]),
      ),
    );
  }
}
