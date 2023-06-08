import 'package:flutter/material.dart';

import '../utils.dart';

class ProfileBannerLeft extends StatelessWidget {
  final Color techColor;
  final Color serviceColor;
  final Color bannerColor;
  final Color iconColor;
  final Color iconBgColor;
  final String imgPath;
  final String tech;
  final String service;
  final bool hasShadow;
  const ProfileBannerLeft(
      {super.key,
      required this.imgPath,
      required this.bannerColor,
      required this.hasShadow,
      required this.iconColor,
      required this.tech,
      required this.service,
      required this.techColor,
      required this.serviceColor,
      required this.iconBgColor});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
            width: spc.wdRat(0.4),
            decoration: BoxDecoration(
                color: bannerColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: hasShadow
                        ? const Color.fromARGB(255, 168, 165, 165)
                        : Colors.transparent,
                    offset: const Offset(0, 0),
                    blurRadius: 8,
                  )
                ]),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: spc.wdRat(0.05)),
                child: SizedBox(
                  width: spc.wdRat(0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: CircleAvatar(
                                radius: 20,
                                backgroundColor: iconBgColor,
                                child: Image.asset(
                                  'assets/images/$imgPath',
                                  height: 25,
                                )),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: iconColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: spc.wdRat(0.2),
                        child: Text(
                          tech,
                          style: TextStyle(
                              color: techColor,
                              height: 1.4,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        service,
                        style: TextStyle(
                            color: serviceColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
