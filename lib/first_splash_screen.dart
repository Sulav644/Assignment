import 'dart:math';

import 'package:jelly_anim/jelly_anim.dart';
import 'package:video_player/video_player.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/second_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xoomship/sign_up/phone_number_send_screen.dart';

import 'dash_board/dash_board.dart';

class FirstSplashScreen extends StatefulWidget {
  const FirstSplashScreen({super.key});

  @override
  State<FirstSplashScreen> createState() => _FirstSplashScreenState();
}

class _FirstSplashScreenState extends State<FirstSplashScreen> {
  // late VideoPlayerController videoPlayerController;
  // void playVideo({int index = 0, bool init = false}) {
  //   videoPlayerController =
  //       VideoPlayerController.asset('assets/images/running_vehicle.mp4')
  //         ..addListener(() {
  //           setState(() {});
  //         })
  //         ..setLooping(true)
  //         ..initialize().then((value) => videoPlayerController.play());
  // }

  @override
  void initState() {
    super.initState();
    // playVideo(init: true);
    Future.delayed(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) {
                return PhoneNumberSendScreen();
              },
            )));
  }

  @override
  void dispose() {
    // videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SecondSplashScreen(),
      )),
      child: Scaffold(
        appBar: cmp.appBar,
        body: Container(
          height: spc.hghtRat(1),
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: spc.hghtRat(1),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: spc.hghtRat(0.3),
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/splash_logo.png',
                          width: spc.wdRat(0.7),
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: spc.wdRat(0.1)),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: spc.hghtRat(0.06)),
                                JellyAnim(
                                    jellyCount: 3,
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
                                    jellyCount: 2,
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
                      ),
                    ),
                    // videoPlayerController.value.isInitialized
                    //     ? SizedBox(
                    //         height: 100,
                    //         child: VideoPlayer(videoPlayerController))
                    //     : CircularProgressIndicator()
                  ],
                ),
              ),
              Positioned(
                top: spc.hghtRat(0.35),
                child: Transform.rotate(
                  angle: -25 / 180 * pi,
                  child: Row(
                    children: [
                      Animate().custom(
                        duration: Duration(seconds: 2),
                        begin: 0,
                        end: spc.wdRat(0.65),
                        builder: (context, value, child) => SizedBox(
                          width: value,
                        ),
                      ),
                      Image.asset(
                        'assets/images/aeroplane.png',
                        width: spc.wdRat(0.3),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
