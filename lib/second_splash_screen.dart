import 'package:day_night_switch/day_night_switch.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/third_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  bool switchMode = true;
  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //     Duration(seconds: 2),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           builder: (context) => ThirdSplashScreen(),
    //         )));
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    final cmp = Components();
    return Scaffold(
      appBar: cmp.appBar,
      body: Container(
        height: spc.hghtRat(1),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 0.3,
                  child: DayNightSwitch(
                    value: switchMode,
                    moonImage: AssetImage('assets/images/boy_1.png'),
                    sunImage: AssetImage('assets/images/boy_2.png'),
                    sunColor: Colors.yellow,
                    moonColor: Colors.white,
                    dayColor: Colors.white,
                    nightColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        switchMode = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spc.hghtRat(0.14),
            ),
            // ColorFiltered(
            //   colorFilter: ColorFilter.mode(Colors.blue, BlendMode.hue),
            //   child: Image.asset(
            //     'assets/images/location_icon.jpg',
            //     width: spc.wdRat(0.8),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: spc.hghtRat(0.06),
            ),
            Text(
              'Tracking Realtime',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.045),
            ),
            Container(
                width: spc.wdRat(0.7),
                child: Text(
                    'sdfdfdsf dsf dsf sdf dsf sd fdsf ds fsd fdsf ds fsd fds ds d')),
            SizedBox(
              height: spc.hghtRat(0.12),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ThirdSplashScreen(),
              )),
              child: Text(
                'Skip',
                style: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
              ),
            ),
            SizedBox(
              height: spc.hghtRat(0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: index == 0
                          ? Colors.yellow
                          : Color.fromARGB(255, 236, 234, 234),
                    ),
                  ),
                ).toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
