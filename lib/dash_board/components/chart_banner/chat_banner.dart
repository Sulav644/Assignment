import 'package:flutter/material.dart';

import '../../../../core/utils.dart';
import '../../../core/components/profile_banner_centered.dart';

class ChatBanner extends StatelessWidget {
  const ChatBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Container(
        width: spc.wdRat(1),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 173, 209, 238),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(spc.wdRat(0.055)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Views this month',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.01),
            ),
            const Text(
              "1,525,499",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 17, 111, 189)),
            ),
            SizedBox(
              height: spc.hghtRat(0.018),
            ),
            const Text(
              "You've got it 👋",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.008),
            ),
            SizedBox(
                width: spc.wdRat(1),
                height: spc.hghtRat(0.2),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    'assets/images/curve.png',
                    fit: BoxFit.cover,
                  ),
                )),
            const Text(
              "Top audiences",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: spc.hghtRat(0.025),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                ProfileBannerCentered(
                  nameColor: Colors.black,
                  msgColor: Color.fromARGB(255, 51, 50, 50),
                  bannerColor: Colors.white,
                  iconColor: Color.fromARGB(255, 155, 151, 151),
                  iconBgColor: Color.fromARGB(255, 238, 158, 185),
                  imgPath: 'boy_1.png',
                  name: 'Brionna',
                  messages: 220,
                  hasShadow: true,
                ),
                SizedBox(
                  width: 15,
                ),
                ProfileBannerCentered(
                  nameColor: Colors.white,
                  msgColor: Color.fromARGB(255, 221, 218, 218),
                  bannerColor: Color.fromARGB(255, 13, 97, 165),
                  iconColor: Colors.white,
                  iconBgColor: Color.fromARGB(255, 149, 198, 238),
                  imgPath: 'boy_2.png',
                  name: 'Myron',
                  messages: 220,
                  hasShadow: false,
                ),
              ],
            ),
          ]),
        ));
  }
}
