import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:jelly_anim/jelly_anim.dart';
import 'package:xoomship/core/utils.dart';

import '../dash_board/dash_board.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final appColor = Color.fromARGB(255, 3, 93, 158);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return DashBoard();
          },
        ));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Container(
          width: spc.wdRat(1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.1)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          JellyAnim(
                              jellyCount: 1,
                              radius: 40,
                              viewPortSize: Size(50, 50),
                              jellyCoordinates: 10,
                              allowOverFlow: true,
                              duration: Duration(milliseconds: 200),
                              jellyPosition: JellyPosition.centerLeft),
                        ],
                      ),
                      SizedBox(width: spc.wdRat(0.12)),
                      Column(
                        children: [
                          SizedBox(height: spc.hghtRat(0.1)),
                          JellyAnim(
                              jellyCount: 1,
                              radius: 10,
                              viewPortSize: Size(50, 50),
                              jellyCoordinates: 10,
                              allowOverFlow: true,
                              duration: Duration(milliseconds: 200),
                              jellyPosition: JellyPosition.centerLeft),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: spc.hghtRat(0.04)),
                  Image.asset(
                    'assets/images/splash_logo.png',
                    height: spc.hghtRat(0.06),
                  ),
                  SizedBox(height: spc.hghtRat(0.14)),
                  Text('You have successfully activated your app for'),
                  SizedBox(height: spc.hghtRat(0.03)),
                  Text('Xoomship',
                      style: TextStyle(
                          color: appColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: spc.hghtRat(0.05)),
                  Container(
                      width: spc.wdRat(1),
                      height: spc.hghtRat(0.075),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      child: Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600))),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: spc.hghtRat(0.06)),
                          JellyAnim(
                              jellyCount: 1,
                              radius: 40,
                              viewPortSize: Size(50, 50),
                              jellyCoordinates: 10,
                              allowOverFlow: true,
                              duration: Duration(milliseconds: 200),
                              jellyPosition: JellyPosition.centerLeft),
                        ],
                      ),
                      SizedBox(width: spc.wdRat(0.2)),
                      Column(
                        children: [
                          SizedBox(height: spc.hghtRat(0.18)),
                          JellyAnim(
                              jellyCount: 1,
                              radius: 10,
                              viewPortSize: Size(50, 50),
                              jellyCoordinates: 10,
                              allowOverFlow: true,
                              duration: Duration(milliseconds: 200),
                              jellyPosition: JellyPosition.centerLeft),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: DefaultTextStyle(
                        style: TextStyle(color: appColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Privacy Policy'),
                                  Text('Contacts'),
                                  Text('Terms of Use')
                                ]),
                            SizedBox(height: spc.hghtRat(0.02)),
                            DefaultTextStyle(
                              style: TextStyle(fontSize: 13, color: appColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.copyright_outlined,
                                      color: appColor, size: 20),
                                  SizedBox(width: 6),
                                  Text('Copyright 2023'),
                                ],
                              ),
                            ),
                            SizedBox(height: spc.hghtRat(0.02)),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
