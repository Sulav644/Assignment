import 'package:assignment_project/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class ProfileBannerCentered extends StatelessWidget {
  final Color nameColor;
  final Color msgColor;
  final Color bannerColor;
  final Color iconColor;
  final Color iconBgColor;
  final String imgPath;
  final String name;
  final int messages;
  final bool hasShadow;
  const ProfileBannerCentered(
      {super.key,
      required this.imgPath,
      required this.name,
      required this.messages,
      required this.bannerColor,
      required this.hasShadow,
      required this.iconColor,
      required this.nameColor,
      required this.msgColor,
      required this.iconBgColor});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfilePage(imgPath: imgPath),
      )),
      child: Container(
          width: spc.wdRat(0.33),
          decoration: BoxDecoration(
              color: bannerColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: hasShadow
                        ? const Color.fromARGB(255, 81, 164, 228)
                        : Colors.transparent,
                    offset: const Offset(-4, 4),
                    blurRadius: 25)
              ]),
          child: Column(children: [
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: spc.wdRat(0.27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.more_horiz,
                    color: iconColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: spc.wdRat(0.05),
                  right: spc.wdRat(0.05),
                  bottom: spc.wdRat(0.05)),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundColor: iconBgColor,
                      radius: 22,
                      child: Image.asset('assets/images/$imgPath')),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: nameColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$messages messages',
                    style: TextStyle(
                        color: msgColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
