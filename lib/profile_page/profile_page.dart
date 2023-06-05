import 'package:flutter/material.dart';
import '../../core/components/profile_banner_left.dart';
import '../core/utils.dart';
import '../sign_up/phone_number_send_screen.dart';
import 'components/bottom_navigation.dart';
import 'components/connect_apps.dart';
import 'components/divider_line.dart';
import 'components/profile_pic.dart';
import 'components/stats_bar.dart';

class ProfilePage extends StatelessWidget {
  final String imgPath;
  const ProfilePage({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
              width: spc.wdRat(1),
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return PhoneNumberSendScreen();
                      },
                    ));
                  },
                  child: ProfilePic(
                    imgPath: imgPath,
                  ),
                ),
                SizedBox(
                  height: spc.hghtRat(0.022),
                ),
                const Text(
                  'Emmy Yost',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Exclusive Marketer',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 97, 95, 95)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: const [
                    StatsBar(),
                    DividerLine(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const ConnectApps(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spc.wdRat(0.07)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      ProfileBannerLeft(
                        techColor: Colors.black,
                        serviceColor: Color.fromARGB(255, 70, 68, 68),
                        bannerColor: Colors.white,
                        iconColor: Color.fromARGB(255, 120, 120, 120),
                        iconBgColor: Color.fromARGB(255, 238, 220, 193),
                        imgPath: 'google_analytics.png',
                        tech: 'Google Analytics',
                        service: 'Ads Tracking',
                        hasShadow: true,
                      ),
                      ProfileBannerLeft(
                        techColor: Colors.black,
                        serviceColor: Color.fromARGB(255, 70, 68, 68),
                        bannerColor: Color.fromARGB(255, 201, 230, 253),
                        iconColor: Color.fromARGB(255, 73, 72, 72),
                        iconBgColor: Colors.white,
                        imgPath: 'stack.png',
                        tech: 'Stack For Business',
                        service: 'Communication',
                        hasShadow: false,
                      ),
                    ],
                  ),
                ),
              ]))),
    );
  }
}
