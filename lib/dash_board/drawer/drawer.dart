import 'package:xoomship/congiment/order_track.dart';
import 'package:xoomship/core/utils.dart';
import 'package:xoomship/dash_board/drawer/components/account_logo_with_details_for_expanded_drawer.dart';
import 'package:xoomship/dash_board/drawer/components/account_logo_with_details_for_unexpanded_drawer.dart';
import 'package:xoomship/dash_board/drawer/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../congiment/congiment_view.dart';
import '../../congiment/my_order.dart';
import '../../congiment/rate_calculator.dart';
import '../../core/components/profile_banner_centered.dart';
import 'components/drawer_image_header.dart';
import 'components/drawer_item.dart';
import 'components/toggle_button.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with TickerProviderStateMixin {
  late TabController tabController;
  bool expandDrawer = false;
  bool showDrawerTitles = false;
  int tabIndex = 0;
  int iconIndex = 0;
  void resizeDrawer() {
    setState(() {
      expandDrawer = !expandDrawer;
    });
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        showDrawerTitles = !showDrawerTitles;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final spc = Space(context: context);
    double drawerIconMinGap = spc.hghtRat(0.01);
    int i = 0;
    return SafeArea(
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          width: expandDrawer ? spc.wdRat(0.8) : spc.wdRat(0.25),
          child: Drawer(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: spc.wdRat(0.056), top: spc.wdRat(0.05)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: spc.hghtRat(0.01),
                      ),
                      Row(children: [
                        for (i = 0; i < 3; i++)
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                    color: (() {
                                      if (i == 0) {
                                        return const Color.fromARGB(
                                            255, 168, 118, 100);
                                      } else if (i == 1) {
                                        return const Color.fromARGB(
                                            255, 243, 183, 92);
                                      } else {
                                        return Colors.green;
                                      }
                                    }()),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                            ],
                          ),
                      ]),
                      SizedBox(
                        height: spc.hghtRat(0.03),
                      ),
                      DrawerImageHeader(
                        context: context,
                        imgPath: 'assets/images/app_icon.png',
                        title: '',
                        expandDrawer: expandDrawer,
                        showDrawerTitles: showDrawerTitles,
                        onClick: () => resizeDrawer(),
                      ),
                      SizedBox(
                        height: expandDrawer
                            ? spc.hghtRat(0.035)
                            : spc.hghtRat(0.02),
                      ),

                      // if (expandDrawer && showDrawerTitles)
                      //   TabBarForDrawer(
                      //       tabController: tabController,
                      //       onClick: (value) => setState(() {
                      //             tabIndex = value;
                      //           }),
                      //       tabIndex: tabIndex),

                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Column(
                          children: [
                            if (expandDrawer && showDrawerTitles)
                              Container(
                                child: TabBar(
                                    isScrollable: true,
                                    dividerColor: Colors.transparent,
                                    indicator: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 7, 106, 187),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    controller: tabController,
                                    onTap: (value) => setState(() {
                                          tabIndex = value;
                                        }),
                                    tabs: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22, vertical: 14),
                                        child: Text(
                                          'PERSONAL',
                                          style: TextStyle(
                                              color: tabIndex == 0
                                                  ? Colors.white
                                                  : const Color.fromARGB(
                                                      255, 141, 135, 135),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 22, vertical: 14),
                                        child: Text(
                                          'BUSINESS',
                                          style: TextStyle(
                                              color: tabIndex == 1
                                                  ? Colors.white
                                                  : const Color.fromARGB(
                                                      255, 141, 135, 135),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ]),
                              ),
                            Container(
                              height: spc.hghtRat(0.4),
                              child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    Column(children: [
                                      SizedBox(height: spc.hghtRat(0.02)),
                                      DrawerItem(
                                          icon: Icons.ballot_rounded,
                                          title: 'Consignment Book',
                                          textColor: iconIndex == 0
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          iconColor: iconIndex == 0
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          onIconClick: () {
                                            setState(() {
                                              iconIndex = 0;
                                            });
                                            resizeDrawer();
                                          },
                                          expandDrawer: expandDrawer,
                                          showDrawerTitles: showDrawerTitles,
                                          onItemClick: () {
                                            setState(() {
                                              iconIndex = 0;
                                            });
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return ConsignmentView();
                                              },
                                            ));
                                          }),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: spc.wdRat(0.02),
                                            right: spc.wdRat(0.15)),
                                        child: Divider(
                                          thickness: 0.6,
                                        ),
                                      ),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      DrawerItem(
                                          icon: Icons.near_me_rounded,
                                          title: 'Track Consignment',
                                          textColor: iconIndex == 1
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          iconColor: iconIndex == 1
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          onIconClick: () {
                                            setState(() {
                                              iconIndex = 1;
                                            });
                                            resizeDrawer();
                                          },
                                          expandDrawer: expandDrawer,
                                          showDrawerTitles: showDrawerTitles,
                                          onItemClick: () {
                                            setState(() {
                                              iconIndex = 1;
                                            });

                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) {
                                                return const OrderTrack();
                                              },
                                            ));
                                          }),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: spc.wdRat(0.02),
                                            right: spc.wdRat(0.15)),
                                        child: Divider(
                                          thickness: 0.6,
                                        ),
                                      ),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      DrawerItem(
                                          icon: Icons.calculate_outlined,
                                          title: 'Rate Calculator',
                                          iconColor: iconIndex == 2
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          textColor: iconIndex == 2
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          expandDrawer: expandDrawer,
                                          showDrawerTitles: showDrawerTitles,
                                          onIconClick: () {
                                            setState(() {
                                              iconIndex = 2;
                                            });
                                            resizeDrawer();
                                          },
                                          onItemClick: () {
                                            setState(() {
                                              iconIndex = 2;
                                            });
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) {
                                                return RateCalculator();
                                              },
                                            ));
                                          }),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: spc.wdRat(0.02),
                                            right: spc.wdRat(0.15)),
                                        child: Divider(
                                          thickness: 0.6,
                                        ),
                                      ),
                                      SizedBox(
                                        height: drawerIconMinGap,
                                      ),
                                      DrawerItem(
                                          icon: Icons.shopping_bag_rounded,
                                          title: 'Package',
                                          textColor: iconIndex == 3
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          iconColor: iconIndex == 3
                                              ? Colors.black
                                              : const Color.fromARGB(
                                                  255, 116, 112, 112),
                                          expandDrawer: expandDrawer,
                                          showDrawerTitles: showDrawerTitles,
                                          onIconClick: () {
                                            setState(() {
                                              iconIndex = 3;
                                            });
                                            resizeDrawer();
                                          },
                                          onItemClick: () => setState(() {
                                                iconIndex = 3;
                                              })),
                                    ]),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: spc.hghtRat(0.04)),
                                        ProfileBannerCentered(
                                            nameColor: Colors.white,
                                            msgColor: Color.fromARGB(
                                                255, 221, 218, 218),
                                            bannerColor: Color.fromARGB(
                                                255, 13, 97, 165),
                                            iconColor: Colors.white,
                                            iconBgColor: Color.fromARGB(
                                                255, 149, 198, 238),
                                            imgPath: 'boy_2.png',
                                            name: 'US',
                                            messages: 'Vender Registration',
                                            hasShadow: false,
                                            flag: 'US',
                                            countryName: 'United States',
                                            index: 1),
                                      ],
                                    )
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      // if (!expandDrawer)
                      //   Padding(
                      //     padding: const EdgeInsets.only(left: 10),
                      //     child: GestureDetector(
                      //         onTap: () => resizeDrawer(),
                      //         child: SvgPicture.asset(
                      //           'assets/images/search.svg',
                      //           height: 18,
                      //           colorFilter: const ColorFilter.mode(
                      //               Color.fromARGB(255, 116, 112, 112),
                      //               BlendMode.srcIn),
                      //         )),
                      //   ),
                      SizedBox(
                        height: expandDrawer
                            ? spc.hghtRat(0.005)
                            : spc.hghtRat(0.02),
                      ),
                      // if (!expandDrawer)
                      //   GestureDetector(
                      //     onTap: () => resizeDrawer(),
                      //     child: ToggleButton(),
                      //   ),
                      SizedBox(
                        height: spc.hghtRat(0.02),
                      ),

                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: spc.wdRat(0.02), right: spc.wdRat(0.15)),
                        child: Divider(
                          thickness: 0.6,
                        ),
                      ),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      // DrawerItem(
                      //     icon: Icons.calendar_month_outlined,
                      //     title: 'Calender',
                      //     textColor: iconIndex == 4
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     iconColor: iconIndex == 4
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     onIconClick: () {
                      //       setState(() {
                      //         iconIndex = 4;
                      //       });
                      //       resizeDrawer();
                      //     },
                      //     expandDrawer: expandDrawer,
                      //     showDrawerTitles: showDrawerTitles,
                      //     onItemClick: () => setState(() {
                      //           iconIndex = 4;
                      //         })),
                      // SizedBox(
                      //   height: drawerIconMinGap,
                      // ),
                      // DrawerItem(
                      //     icon: Icons.contact_page_outlined,
                      //     title: 'Contacts',
                      //     textColor: iconIndex == 5
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     iconColor: iconIndex == 5
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     onIconClick: () {
                      //       setState(() {
                      //         iconIndex = 5;
                      //       });
                      //       resizeDrawer();
                      //     },
                      //     expandDrawer: expandDrawer,
                      //     showDrawerTitles: showDrawerTitles,
                      //     onItemClick: () => setState(() {
                      //           iconIndex = 5;
                      //         })),
                      // SizedBox(
                      //   height: spc.hghtRat(0.055),
                      // ),
                      // if (expandDrawer)
                      //   const Text(
                      //     'ACCOUNT',
                      //     style: TextStyle(
                      //         fontSize: 11,
                      //         color: Color.fromARGB(255, 116, 112, 112),
                      //         fontWeight: FontWeight.w600),
                      //   ),
                      // SizedBox(
                      //   height: spc.hghtRat(0.02),
                      // ),
                      // drawerItemWithSvgAndTag(
                      //     svgPath: 'notification.svg',
                      //     title: 'Notifications',
                      //     tag: '24',
                      //     color: const Color.fromARGB(255, 165, 248, 167),
                      //     svgColor: iconIndex == 6
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     textColor: iconIndex == 6
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     onIconClick: () {
                      //       setState(() {
                      //         iconIndex = 6;
                      //       });
                      //       resizeDrawer();
                      //     },
                      //     onItemClick: () => setState(() {
                      //           iconIndex = 6;
                      //         })),
                      // SizedBox(
                      //   height: drawerIconMinGap,
                      // ),
                      // drawerItemWithSvgAndTag(
                      //     svgPath: 'chat.svg',
                      //     title: 'Chat',
                      //     tag: '8',
                      //     color: const Color.fromARGB(255, 241, 191, 115),
                      //     svgColor: iconIndex == 7
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     textColor: iconIndex == 7
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     onIconClick: () {
                      //       setState(() {
                      //         iconIndex = 7;
                      //       });
                      //       resizeDrawer();
                      //     },
                      //     onItemClick: () => setState(() {
                      //           iconIndex = 7;
                      //         })),
                      // SizedBox(
                      //   height: drawerIconMinGap,
                      // ),
                      // drawerItemWithSvg(
                      //     svgPath: 'filter.svg',
                      //     title: 'Settings',
                      //     color: iconIndex == 8
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     svgColor: iconIndex == 8
                      //         ? Colors.black
                      //         : const Color.fromARGB(255, 116, 112, 112),
                      //     onIconClick: () {
                      //       setState(() {
                      //         iconIndex = 8;
                      //       });
                      //       resizeDrawer();
                      //     },
                      //     onItemClick: () => setState(() {
                      //           iconIndex = 8;
                      //         })),
                      if (!expandDrawer)
                        AccountLogoWithDetailsForUnExpandedDrawer(),
                      if (expandDrawer && showDrawerTitles)
                        AccountLogoWithDetailsForExpandedDrawer()
                    ]),
              ))),
    );
  }

  Widget drawerItemWithSvgAndTag(
          {required String svgPath,
          required String title,
          required String tag,
          required Color svgColor,
          required Color textColor,
          required Color color,
          required VoidCallback onIconClick,
          required VoidCallback onItemClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 30,
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => onIconClick(),
                child: SvgPicture.asset(
                  'assets/images/$svgPath',
                  height: 20,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
              ),
            ),
            if (expandDrawer && showDrawerTitles)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => onItemClick(),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: Space(context: context).wdRat(0.08)),
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(100)),
                        alignment: Alignment.center,
                        child: Text(
                          tag,
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      );
  Widget drawerItemWithSvg(
          {required String svgPath,
          required String title,
          required Color color,
          required Color svgColor,
          required VoidCallback onIconClick,
          required VoidCallback onItemClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 30,
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => onIconClick(),
                child: SvgPicture.asset(
                  'assets/images/$svgPath',
                  height: 20,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
              ),
            ),
            if (expandDrawer && showDrawerTitles)
              GestureDetector(
                onTap: () => onItemClick(),
                child: Text(
                  title,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5),
                ),
              ),
          ],
        ),
      );
}
