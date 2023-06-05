import 'package:xoomship/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:xoomship/dash_board/dash_board.dart';

class ThirdSplashScreen extends StatefulWidget {
  const ThirdSplashScreen({super.key});

  @override
  State<ThirdSplashScreen> createState() => _ThirdSplashScreenState();
}

class _ThirdSplashScreenState extends State<ThirdSplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //     Duration(seconds: 2),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //           builder: (context) => DashBoard(),
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
            SizedBox(
              height: spc.hghtRat(0.1),
            ),
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.blue, BlendMode.hue),
              child: Image.asset(
                'assets/images/mobile_icon.jpg',
                width: spc.wdRat(0.7),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: spc.hghtRat(0.04),
            ),
            Text(
              'Fast Booking',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.04),
            ),
            Container(
                width: spc.wdRat(0.7),
                child: Text(
                    'sdfdfdsf dsf dsf sdf dsf sd fdsf ds fsd fdsf ds fsd fds ds d')),
            SizedBox(
              height: spc.hghtRat(0.1),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DashBoard(),
              )),
              child: Text(
                'Skip',
                style: TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
              ),
            ),
            SizedBox(
              height: spc.hghtRat(0.03),
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
                      backgroundColor: index == 1
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
