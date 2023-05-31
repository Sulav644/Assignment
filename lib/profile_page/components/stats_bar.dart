import 'package:flutter/material.dart';
import '../../core/utils.dart';
import 'drop_icon.dart';
import 'stat_stick.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
      child: Column(
        children: [
          Container(
              width: spc.wdRat(1),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 119, 196),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(children: [
                const DropIcon(),
                SizedBox(
                  height: spc.hghtRat(0.016),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    StatStick(
                      color: Colors.white,
                      height: 0.06,
                      val: 2,
                    ),
                    StatStick(
                      color: Colors.white,
                      height: 0.10,
                      val: 0,
                    ),
                    StatStick(
                        color: Color.fromARGB(255, 148, 196, 236),
                        height: 0.16,
                        val: 4),
                    StatStick(
                        color: Color.fromARGB(255, 241, 230, 128),
                        height: 0.08,
                        val: 0),
                    StatStick(
                        color: Color.fromARGB(255, 238, 163, 188),
                        height: 0.16,
                        val: 6),
                    StatStick(color: Colors.white, height: 0.08, val: 0),
                    StatStick(
                        color: Color.fromARGB(255, 241, 230, 128),
                        height: 0.03,
                        val: 8),
                    StatStick(
                        color: Color.fromARGB(255, 241, 230, 128),
                        height: 0.06,
                        val: 0),
                    StatStick(
                        color: Color.fromARGB(255, 117, 185, 241),
                        height: 0.3,
                        val: 10),
                    StatStick(
                        color: Color.fromARGB(255, 221, 234, 245),
                        height: 0.09,
                        val: 0),
                    StatStick(color: Colors.white, height: 0.05, val: 12),
                  ],
                ),
                SizedBox(
                  height: spc.hghtRat(0.02),
                ),
              ])),
        ],
      ),
    );
  }
}
