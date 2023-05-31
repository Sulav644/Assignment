import 'package:flutter/material.dart';

import '../../../core/utils.dart';

class ProfilePic extends StatelessWidget {
  final String imgPath;
  const ProfilePic({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Container(
      height: spc.hghtRat(0.15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spc.hghtRat(0.018)),
                child: circles(rad: 8, color: Colors.green),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: spc.wdRat(0.08), bottom: spc.hghtRat(0.026)),
                child: circles(rad: 4, color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(
            width: 14,
          ),
          CircleAvatar(
            radius: 40,
            child: Image.asset('assets/images/$imgPath'),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: spc.hghtRat(0.01)),
                child: circles(rad: 12, color: Colors.yellow),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: spc.wdRat(0.12), bottom: spc.hghtRat(0.065)),
                child: circles(rad: 6, color: Colors.blue),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget circles({required double rad, required Color color}) => Container(
        width: rad,
        height: rad,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
      );
}
