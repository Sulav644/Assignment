import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/utils.dart';
import '../../../profile_page/profile_page.dart';

class AccountLogoWithDetailsForExpandedDrawer extends StatelessWidget {
  const AccountLogoWithDetailsForExpandedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    return Expanded(
      child: Container(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(right: Space(context: context).wdRat(0.08)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: spc.hghtRat(0.084),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 0.5,
                              color: const Color.fromARGB(255, 223, 219, 219)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 14),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return ProfilePage(
                                        imgPath: 'boy_1.png',
                                      );
                                    },
                                  ));
                                },
                                child: CircleAvatar(
                                    radius: 15,
                                    child:
                                        Image.asset('assets/images/boy_1.png')),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: spc.wdRat(0.4),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                'Nina Argemia',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 13),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 7, 106, 187),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4.0),
                                                  child: Text(
                                                    'Verified',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 9),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            'nina_org@orgemia.com',
                                            style: TextStyle(
                                                fontSize: 8.5,
                                                color: Color.fromARGB(
                                                    255, 119, 114, 114)),
                                          ),
                                        ]),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.more_horiz,
                                size: 18,
                                color: Color.fromARGB(255, 61, 58, 58),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spc.hghtRat(0.035),
              ),
            ],
          )),
    );
  }
}
