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
    double drawerIconMinGap = spc.hghtRat(0.02);
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
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: (() {
                                      if (i == 0) {
                                        return Colors.brown;
                                      } else if (i == 1) {
                                        return Colors.orange;
                                      } else {
                                        return Colors.blue;
                                      }
                                    }()),
                                    borderRadius: BorderRadius.circular(100)),
                              ),
                              const SizedBox(
                                width: 8,
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
                        height: spc.hghtRat(0.034),
                      ),
                      if (expandDrawer && showDrawerTitles)
                        Padding(
                          padding: EdgeInsets.only(
                              right: Space(context: context).wdRat(0.08)),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 194, 191, 191)),
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
                              child: const Icon(Icons.search,
                                  color: Color.fromARGB(255, 116, 112, 112))),
                        ),
                      SizedBox(
                        height: drawerIconMinGap,
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
                        height: drawerIconMinGap,
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
                        onClick: () {
                          setState(() {
                            iconIndex = 0;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 1;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 2;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 3;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 4;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 5;
                          });
                          resizeDrawer();
                        },
                      ),
                      SizedBox(
                        height: spc.hghtRat(0.04),
                      ),
                      if (expandDrawer)
                        const Text(
                          'ACCOUNT',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 116, 112, 112),
                              fontWeight: FontWeight.w600),
                        ),
                      SizedBox(
                        height: drawerIconMinGap,
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
                        onClick: () {
                          setState(() {
                            iconIndex = 6;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 7;
                          });
                          resizeDrawer();
                        },
                      ),
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
                        onClick: () {
                          setState(() {
                            iconIndex = 8;
                          });
                          resizeDrawer();
                        },
                      ),
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
                                                  color: const Color.fromARGB(
                                                      255, 194, 191, 191)),
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
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                'nina_org@orgemia.com',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        8.5,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            61,
                                                                            58,
                                                                            58)),
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
                                  const SizedBox(
                                    height: 18,
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
          required VoidCallback onClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: GestureDetector(
          onTap: () => onClick(),
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
                Text(
                  title,
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.w500),
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
          required VoidCallback onClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: GestureDetector(
          onTap: () => onClick(),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 30,
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/images/$svgPath',
                  height: 20,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
              ),
              if (expandDrawer && showDrawerTitles)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: textColor, fontWeight: FontWeight.w500),
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
        ),
      );
  Widget drawerItemWithSvg(
          {required String svgPath,
          required String title,
          required Color color,
          required Color svgColor,
          required VoidCallback onClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: GestureDetector(
          onTap: () => onClick(),
          child: Row(
            children: [
              Container(
                width: 35,
                height: 30,
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/images/$svgPath',
                  height: 20,
                  colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
                ),
              ),
              if (expandDrawer && showDrawerTitles)
                Text(
                  title,
                  style: TextStyle(color: color, fontWeight: FontWeight.w500),
                ),
            ],
          ),
        ),
      );
  Widget drawerImageHeader(
          {required BuildContext context,
          required String imgPath,
          required String title,
          required VoidCallback onClick}) =>
      Padding(
        padding: EdgeInsets.only(left: expandDrawer ? 0 : 10),
        child: GestureDetector(
          onTap: () => onClick(),
          child: Row(
            children: [
              Image.asset(
                imgPath,
                width: 20,
              ),
              if (expandDrawer && showDrawerTitles)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Space(context: context).wdRat(0.03),
                          ),
                          Text(
                            title,
                            style: TextStyle(fontWeight: FontWeight.w500),
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
                        child: const Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 116, 112, 112),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
}
