import 'package:assignment_project/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                                        return Color.fromARGB(
                                            255, 168, 118, 100);
                                      } else if (i == 1) {
                                        return Color.fromARGB(
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
                      drawerImageHeader(
                        context: context,
                        imgPath: 'assets/images/stack_cube.png',
                        title: 'Marketerz',
                        onClick: () => resizeDrawer(),
                      ),
                      SizedBox(
                        height: expandDrawer
                            ? spc.hghtRat(0.035)
                            : spc.hghtRat(0.02),
                      ),
                      if (expandDrawer && showDrawerTitles)
                        Padding(
                          padding: EdgeInsets.only(
                              right: Space(context: context).wdRat(0.08)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: Color.fromARGB(255, 223, 219, 219)),
                                borderRadius: BorderRadius.circular(10)),
                            child: TabBar(
                                indicator: BoxDecoration(
                                    color: Color.fromARGB(255, 7, 106, 187),
                                    borderRadius: BorderRadius.circular(10)),
                                controller: tabController,
                                onTap: (value) => setState(() {
                                      tabIndex = value;
                                    }),
                                tabs: [
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      'PERSONAL',
                                      style: TextStyle(
                                          color: tabIndex == 0
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 141, 135, 135),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      'BUSINESS',
                                      style: TextStyle(
                                          color: tabIndex == 1
                                              ? Colors.white
                                              : Color.fromARGB(
                                                  255, 141, 135, 135),
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      if (!expandDrawer)
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                              onTap: () => resizeDrawer(),
                              child: SvgPicture.asset(
                                'assets/images/search.svg',
                                height: 18,
                                colorFilter: ColorFilter.mode(
                                    Color.fromARGB(255, 116, 112, 112),
                                    BlendMode.srcIn),
                              )),
                        ),
                      SizedBox(
                        height: expandDrawer
                            ? spc.hghtRat(0.005)
                            : spc.hghtRat(0.02),
                      ),
                      if (!expandDrawer)
                        GestureDetector(
                          onTap: () => resizeDrawer(),
                          child: Container(
                              width: 38,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 124, 120, 120))),
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 15,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                              )),
                        ),
                      SizedBox(
                        height: spc.hghtRat(0.02),
                      ),
                      drawerItemWithSvg(
                          svgPath: 'grid.svg',
                          title: 'Dashboard',
                          color: iconIndex == 0
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          svgColor: iconIndex == 0
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 0;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 0;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItem(
                          icon: Icons.shop_outlined,
                          title: 'Product',
                          textColor: iconIndex == 1
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          iconColor: iconIndex == 1
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 1;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 1;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItemWithSvg(
                          svgPath: 'open_mail.svg',
                          title: 'Mail',
                          color: iconIndex == 2
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          svgColor: iconIndex == 2
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 2;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 2;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItemWithSvg(
                          svgPath: 'flag.svg',
                          title: 'Campaigns',
                          color: iconIndex == 3
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          svgColor: iconIndex == 3
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 3;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 3;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItem(
                          icon: Icons.calendar_month_outlined,
                          title: 'Calender',
                          textColor: iconIndex == 4
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          iconColor: iconIndex == 4
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 4;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 4;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItem(
                          icon: Icons.contact_page_outlined,
                          title: 'Contacts',
                          textColor: iconIndex == 5
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          iconColor: iconIndex == 5
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 5;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 5;
                              })),
                      SizedBox(
                        height: spc.hghtRat(0.055),
                      ),
                      if (expandDrawer)
                        const Text(
                          'ACCOUNT',
                          style: TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 116, 112, 112),
                              fontWeight: FontWeight.w600),
                        ),
                      SizedBox(
                        height: spc.hghtRat(0.02),
                      ),
                      drawerItemWithSvgAndTag(
                          svgPath: 'notification.svg',
                          title: 'Notifications',
                          tag: '24',
                          color: const Color.fromARGB(255, 165, 248, 167),
                          svgColor: iconIndex == 6
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          textColor: iconIndex == 6
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 6;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 6;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItemWithSvgAndTag(
                          svgPath: 'chat.svg',
                          title: 'Chat',
                          tag: '8',
                          color: const Color.fromARGB(255, 241, 191, 115),
                          svgColor: iconIndex == 7
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          textColor: iconIndex == 7
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 7;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 7;
                              })),
                      SizedBox(
                        height: drawerIconMinGap,
                      ),
                      drawerItemWithSvg(
                          svgPath: 'filter.svg',
                          title: 'Settings',
                          color: iconIndex == 8
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          svgColor: iconIndex == 8
                              ? Colors.black
                              : const Color.fromARGB(255, 116, 112, 112),
                          onIconClick: () {
                            setState(() {
                              iconIndex = 8;
                            });
                            resizeDrawer();
                          },
                          onItemClick: () => setState(() {
                                iconIndex = 8;
                              })),
                      if (!expandDrawer)
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: spc.wdRat(0.01)),
                          child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Icon(Icons.more_horiz),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CircleAvatar(
                                      child: Image.asset(
                                          'assets/images/boy_1.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                        )),
                      if (expandDrawer && showDrawerTitles)
                        Expanded(
                          child: Container(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Space(context: context)
                                            .wdRat(0.08)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: spc.hghtRat(0.08),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: const Color.fromARGB(
                                                      255, 223, 219, 219)),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 14),
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  CircleAvatar(
                                                      radius: 15,
                                                      child: Image.asset(
                                                          'assets/images/boy_1.png')),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  SizedBox(
                                                    width: spc.wdRat(0.4),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: const [
                                                              Text(
                                                                'Nina Argemia',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              SizedBox(
                                                                height: 4,
                                                              ),
                                                              Text(
                                                                'nina_org@orgemia.com',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        8.5,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            119,
                                                                            114,
                                                                            114)),
                                                              ),
                                                            ]),
                                                      ],
                                                    ),
                                                  ),
                                                  const Icon(
                                                    Icons.more_horiz,
                                                    size: 18,
                                                    color: Color.fromARGB(
                                                        255, 61, 58, 58),
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
                        )
                    ]),
              ))),
    );
  }

  Widget drawerItem(
          {required IconData icon,
          required String title,
          required Color textColor,
          required Color iconColor,
          required VoidCallback onIconClick,
          required VoidCallback onItemClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: GestureDetector(
          onTap: () => onIconClick(),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 30,
                alignment: Alignment.centerLeft,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              if (expandDrawer && showDrawerTitles)
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
            ],
          ),
        ),
      );
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
  Widget drawerImageHeader(
          {required BuildContext context,
          required String imgPath,
          required String title,
          required VoidCallback onClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => onClick(),
              child: Image.asset(
                imgPath,
                width: 20,
              ),
            ),
            if (expandDrawer && showDrawerTitles)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: Space(context: context).wdRat(0.03),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Text(
                          'v1.0',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: Space(context: context).wdRat(0.08)),
                      child: SvgPicture.asset(
                        'assets/images/search.svg',
                        height: 18,
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(255, 116, 112, 112),
                            BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      );
}
